class EmissionFactor < ApplicationRecord
  validates_uniqueness_of :uuid
  has_many :emission_calculations

  def self.normalize(str)
    str.parameterize
  end
end
