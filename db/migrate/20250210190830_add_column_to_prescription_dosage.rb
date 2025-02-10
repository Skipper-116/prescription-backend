class AddColumnToPrescriptionDosage < ActiveRecord::Migration[8.0]
  def change
    add_reference :prescription_dosages, :prescription, null: false, foreign_key: true
  end
end
