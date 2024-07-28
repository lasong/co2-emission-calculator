require 'rails_helper'

RSpec.describe FileHandler, type: :service do
  let(:file) { fixture_file_upload("#{Rails.root}/spec/fixtures/emissions-test-data.xlsx") }

  describe '#row_count' do
    it 'returns the number of rows in file, excluding header' do
      expect(described_class.new(file).row_count).to eq 28
    end
  end

  describe '#rows' do
    it 'returns array of rows in file, excluding header' do
      rows = described_class.new(file).rows
      expect(rows).to be_an_instance_of(Array)
      expect(rows.size).to eq 28
    end
  end
end
