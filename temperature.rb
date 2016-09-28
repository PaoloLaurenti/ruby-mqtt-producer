class Temperature < BinData::Record
  endian  :little

  uint8   :msg_type
  uint32  :msg_value
end
