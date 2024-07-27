class ProcessEmissionJob < ApplicationJob
  queue_as :default

  def perform(emission_id)
    emission = Emission.find(emission_id)
    EmissionCalculator.new(emission).calculate_and_save
  end
end
