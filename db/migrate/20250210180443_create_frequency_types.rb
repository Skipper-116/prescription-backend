class CreateFrequencyTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :frequency_types do |t|
      t.string :name
      t.float :multiplier
      t.boolean :voided
      t.date :voided_date

      t.timestamps
    end
  end
end
