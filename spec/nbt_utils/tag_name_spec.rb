RSpec.describe NBTUtils::TagName do
  subject(:tag_name) { described_class.new }

  describe '#value' do
    it 'returns the data value' do
      expect(tag_name.value).to eq('')
      tag_name.data = 'foo'
      expect(tag_name.value).to eq('foo')
    end
  end

  describe '#value=' do
    it 'returns the data value' do
      tag_name.value = 'marf'
      expect(tag_name.data).to eq('marf')
    end
  end
end
