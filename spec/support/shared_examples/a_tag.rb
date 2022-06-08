# frozen_string_literal: true

RSpec.shared_examples_for 'a tag' do |type_id, payload_class|
  it 'has the type_id and payload_class', :aggregate_failures do
    expect(described_class.type_id).to eq(type_id)
    expect(described_class.payload_class).to eq(payload_class)
  end
end
