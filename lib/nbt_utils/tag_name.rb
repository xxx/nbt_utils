module NBTUtils
  class TagName < ::BinData::Record
    # Spec says this is a TAG_Short, which is signed. Staying strict
    # though this may really be unsigned in practice.
    int16be :len, :value => Proc.new { data.length }
    string :data, :read_length => :len

    # things break for some reason if you just call the string :value
    def value
      data
    end
  end
end