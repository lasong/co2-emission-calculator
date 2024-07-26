require 'csv'

CSV.foreach("#{File.dirname(__FILE__)}/seed-data/emission_factors.csv", headers: true) do |row|
  EmissionFactor.create_with(
    name: row['Name'],
    quantity: row['Quantity'].to_f,
    unit: row['Unit']
  ).find_or_create_by(uuid: row['Name'].parameterize)
end
