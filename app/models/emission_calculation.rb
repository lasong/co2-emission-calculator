class EmissionCalculation < ApplicationRecord
  belongs_to :emission
  belongs_to :emission_factor
end
