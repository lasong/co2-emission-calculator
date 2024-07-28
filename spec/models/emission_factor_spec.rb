require 'rails_helper'

RSpec.describe EmissionFactor, type: :model do
  describe '.normalize' do
    it 'transforms string using the rails string parameterize method' do
      expect(EmissionFactor.normalize('This is some StrÜng')).to eq 'this-is-some-strung'
    end
  end
end
