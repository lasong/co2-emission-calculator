require 'rails_helper'

RSpec.describe Emission, type: :model do
  let(:file) { fixture_file_upload("#{Rails.root}/spec/fixtures/emissions-test-data.xlsx") }
  let(:emission) { Emission.new(name: 'file', file: file) }

  describe 'validations' do
    context 'when the file has 100 or fewer rows' do
      it 'is valid' do
        expect(emission).to be_valid
      end
    end

    context 'when the file has more than 100000 rows' do
      it 'is invalid' do
        allow_any_instance_of(FileHandler)
          .to receive(:row_count).and_return(Emission::MAX_FILE_ROW_COUNT + 2)

        expect(emission).to_not be_valid
        expect(emission.errors[:file]).to include('contains more than 100000 rows')
      end
    end
  end
end
