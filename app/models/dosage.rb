class Dosage < ApplicationRecord
  belongs_to :medication
  belongs_to :frequency_type
end
