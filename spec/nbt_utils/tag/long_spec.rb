# frozen_string_literal: true

RSpec.describe NBTUtils::Tag::Long do
  it_behaves_like 'a tag', 4, BinData::Int64be
end
