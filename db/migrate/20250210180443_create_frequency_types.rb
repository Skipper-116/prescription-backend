class CreateFrequencyTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :frequency_types do |t|
      t.string :name, null: false
      t.float :multiplier, null: false
      t.boolean :voided, default: false
      t.date :voided_date, default: nil

      t.timestamps
    end
  end
end
