class CreateMedications < ActiveRecord::Migration[8.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.boolean :voided
      t.date :voided_date

      t.timestamps
    end
  end
end
