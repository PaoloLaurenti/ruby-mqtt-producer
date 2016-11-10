# Ruby MQTT producer

This is a ruby terminal application that publishes random MQTT messages to an MQTT host.

Every MQTT message is serialized to binary, little endian format.

The binary structure is defined as follows:

- 1 Byte -> 2 (the value 2 means that the message represents the external temperature; it cannot be changed)
- 4 Byte -> <integer> representing the value of the temperature in °C <br/>
The temperatures values will be inside the range -15 <--> +40

## How to run the application?

There are two ways to run the application.

### Manually

First of all you need ruby version 2.3.* installed along with the [bundler](http://bundler.io/) gem.
You can clone this repository and move all the files of the repository inside the folder where you want to place your deployed application.

After that, you can run (inside the "src" folder of the application)
```
bundle install && chmod +x producer.rb
```
in order to install all the dependencies of the application and make the producer file executable.

If you run
```
./producer.rb
```

you will see the following help message
```
Commands:
  producer.rb help [COMMAND]             # Describe available commands or one specific command
  producer.rb produce -i, --id-seller=N  # start producing MQTT messages
```

In order to start publishing messages you have to specify the *produce* command as follows:

```
Usage:
  producer.rb produce

  Options:
    -u, [--uri=URI]    # URI of the MQTT host where to publish messages
                       # Default: mqtt://guest:guest@localhost:1883
    -s, [--span=N]     # waiting time in seconds between every MQTT publication
                       # Default: 5
    -c, [--count=N]    # number of concurrent producers to run
                       # Default: 1
    -i, --id-seller=N  # id of the shop
```

### By Docker

If you want you can build the docker image on your own.<br/>
It's not necessary if you only need to run the producer, because the docker images is already published on DockerHub. So, in this case, you can skip the following section and go to "Run container" section.

#### Image building
First, you have to build the docker image locally. In order to achieve that you have to run the following commands from the *docker* directory:

```
source docker.sh
buildRubyMQTTInternalTemperaturesProducer
```
After the building of the docker image has finished you will have (at least) two docker images installed. If you run `docker images`, it will shows you all the images you have installed. Two of those will be:

- ggpltd/ruby_mqtt_internal_temperatures_producer
- ruby, version 2.3

#### Container running

In order run the producer you have to run the following command appending the needed parameters as explained in the *manual* section above:

```
docker run -i -t --rm ggpltd/ruby_mqtt_internal_temperatures_producer:latest <ARGS>
```
