class CreatePrescriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :prescriptions do |t|
      t.float :amount
      t.boolean :voided, default: false
      t.date :voided_date, default: nil

      t.timestamps
    end
  end
end
