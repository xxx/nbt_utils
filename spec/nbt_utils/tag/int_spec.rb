RSpec.describe NBTUtils::Tag::Int do
  it_behaves_like 'a tag', 3, BinData::Int32be
end
