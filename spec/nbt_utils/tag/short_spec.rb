RSpec.describe NBTUtils::Tag::Short do
  it_behaves_like 'a tag', 2, BinData::Int16be
end
