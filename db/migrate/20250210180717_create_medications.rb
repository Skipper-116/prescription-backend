class CreateMedications < ActiveRecord::Migration[8.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.boolean :voided, default: false
      t.date :voided_date, default: nil

      t.timestamps
    end
  end
end
