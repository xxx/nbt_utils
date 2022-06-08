# frozen_string_literal: true

RSpec.describe NBTUtils::File do
  let(:file) { described_class.new(File.expand_path("../../../doc/#{fixture}", __FILE__)) }
  let(:fixture) { 'test_uncompressed.nbt' }

  describe '#read' do
    subject(:call) { file.read }

    shared_examples 'reads the file' do
      it 'reads the file and returns the root tag', :aggregate_failures do
        expect(call.name).to eq('hello world')
        expect(call.payload.first.payload.value).to eq('Bananrama')
      end
    end

    context 'when the file is not compressed' do
      let(:fixture) { 'test_uncompressed.nbt' }

      include_examples 'reads the file'
    end

    context 'when the file is compressed' do
      let(:fixture) { 'test.nbt' }

      include_examples 'reads the file'
    end
  end

  describe '#write' do
    let(:root) { file.read }

    let(:out_path) { "#{__dir__}/write-test.nbt" }

    shared_examples 'writes the file' do
      it 'writes the file out' do
        tag = root.payload.first

        file.write(out_path, tag, compressed)

        read_in = described_class.new(out_path).read
        expect(read_in.payload.value).to eq 'Bananrama'
      ensure
        File.delete(out_path) if File.exist?(out_path)
      end
    end

    context 'when the file is not compressed' do
      let(:compressed) { false }

      include_examples 'writes the file'
    end

    context 'when the file is compressed' do
      let(:compressed) { true }

      include_examples 'writes the file'
    end
  end
end
