**Ruby MQTT producer**

This is a ruby terminal application that publishes random MQTT messages to an MQTT host.

Every MQTT message is serialized to binary, little endian format.

The binary structure is defined as follows:

- 1 Byte -> 2 (the value 2 means that the message represents the external temperature; it cannot be changed)
- 4 Byte -> <integer> representing the value of the temperature in °C <br/>
The temperatures values will be inside the range -15 <--> +40

**How to run the application?**

First of all you need ruby version 2.3.* installed along with the [bundler](http://bundler.io/) gem.
You can clone this repository and move all the files of the repository inside the folder where you want to place your deployed application.

After that, you can run (inside the base folder of the application)
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
    -s, [--span=N]     # waiting time in second between every MQTT publications
                       # Default: 5
    -c, [--count=N]    # number of concurrent prodcers to run
                       # Default: 1
    -i, --id-seller=N  # id of the shop
```
