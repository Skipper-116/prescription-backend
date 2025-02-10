class CreateDosages < ActiveRecord::Migration[8.0]
  def change
    create_table :dosages do |t|
      t.references :medication, null: false, foreign_key: true
      t.references :frequency_type, null: false, foreign_key: true
      t.float :amount
      t.string :unit
      t.integer :default_duration

      t.timestamps
    end
  end
end
