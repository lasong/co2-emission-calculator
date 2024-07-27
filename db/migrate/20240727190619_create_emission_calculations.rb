class CreateEmissionCalculations < ActiveRecord::Migration[7.0]
  def change
    create_table :emission_calculations do |t|
      t.integer :emission_id
      t.integer :emission_factor_id
      t.float :quantity
      t.float :value
      t.string :source
      t.string :unit

      t.timestamps
    end
  end
end
