class CreatePrescriptionDosages < ActiveRecord::Migration[8.0]
  def change
    create_table :prescription_dosages do |t|
      t.references :dosage, null: false, foreign_key: true
      t.integer :duration
      t.boolean :voided
      t.date :voded_date

      t.timestamps
    end
  end
end
