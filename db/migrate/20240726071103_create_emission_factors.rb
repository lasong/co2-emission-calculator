class CreateEmissionFactors < ActiveRecord::Migration[7.0]
  def change
    create_table :emission_factors do |t|
      t.string :name
      t.string :uuid
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
