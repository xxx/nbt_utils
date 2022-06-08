# frozen_string_literal: true

RSpec.describe NBTUtils::Tag::Float do
  it_behaves_like 'a tag', 5, BinData::FloatBe
end
