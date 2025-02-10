class CreatePrescriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :prescriptions do |t|
      t.float :amount
      t.boolean :voided
      t.date :voided_date

      t.timestamps
    end
  end
end
