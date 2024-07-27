class EmissionCalculator
  def initialize(emission)
    @emission = emission
  end

  def calculate_and_save
    emission.file.open do |file|
      spreadsheet = Roo::Spreadsheet.open(file)

      spreadsheet.each_with_index do |row, index|
        next if index.zero? # Skip header row

        emission_factor = EmissionFactor.find_by!(uuid: EmissionFactor.normalize(row[3]))
        quantity = row[1].to_f

        EmissionCalculation.create!(
          emission_id: emission.id,
          emission_factor_id: emission_factor.id,
          value: quantity * emission_factor.quantity,
          quantity: quantity,
          source: row[0],
          unit: row[2]
        )
      end
    end
  end

  private

  attr_reader :emission
end
