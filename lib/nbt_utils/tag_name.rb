# frozen_string_literal: true

module NBTUtils
  class TagName < ::BinData::Record
    # Spec says this is a TAG_Short, which is signed. Staying strict
    # though this may really be unsigned in practice.
    int16be :len, value: proc { data.length }
    string :data, read_length: :len

    # things break for some reason if you just call the string :value
    def value
      data
    end

    def value=(other_value)
      self.data = (other_value)
    end
  end
end
