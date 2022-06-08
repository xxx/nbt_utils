RSpec.describe NBTUtils::Tag::Byte do
  it_behaves_like 'a tag', 1, BinData::Int8be
end
