module NBT
  class TagName < BinData::Record
    # Spec says this is a TAG_Short, which is signed. Staying strict
    # though this may really be unsigned in practice.
    int16be :len, :value => lambda { data.length }
    string :data, :read_length => :len
  end
end