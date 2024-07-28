require 'rails_helper'

RSpec.describe EmissionCalculator, type: :service do
  let(:file) { fixture_file_upload("#{Rails.root}/spec/fixtures/emissions-test-data.xlsx") }
  let(:ef_name) { 'Carbon monoxide from car exhaust' }
  let(:file_row) { ['Car driving', 1000, 'km', ef_name] }
  let!(:emission_factor) do
    EmissionFactor.create!(name: ef_name, uuid: EmissionFactor.normalize(ef_name), quantity: '20')
  end
  let!(:emission) { Emission.create!(name: 'file', file: file) }

  describe '#calculate_and_save' do
    before do
      allow_any_instance_of(FileHandler).to receive(:rows).and_return([file_row])
    end

    it 'saves emission calculation' do
      emission_calculator = described_class.new(emission)
      expect do emission_calculator.calculate_and_save
      end.to change(EmissionCalculation, :count).by(1)
    end

    it 'calculates co2 emission value' do
      emission_calculator = described_class.new(emission)
      emission_calculator.calculate_and_save

      expect(EmissionCalculation.first.value).to eq 20_000
    end
  end
end
