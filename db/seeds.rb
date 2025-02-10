# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# ID	Name	Unit Price	Dosage Amount	Frequency	Default Duration
# 1	Metformin	$5.00	500 mg	Once daily	30 days
# $5.00	500 mg	Twice daily	30 days
# $5.00	1000 mg	Once daily	30 days
# 2	Phentermine	$15.00	15 mg	Once daily	14 days
# $15.00	30 mg	Once daily	14 days
# $15.00	37.5 mg	Once daily	14 days
# 3	Naltrexone	$12.00	25 mg	Once daily	7 days
# $12.00	50 mg	Once daily	28 days
# $12.00	50 mg	Twice daily	28 days
# 4	Wellbutrin	$10.00	100 mg	Twice daily	14 days
# $10.00	150 mg	Once daily	14 days
# $10.00	150 mg	Twice daily	14 days
# 5	Topiramate	$8.00	25 mg	Once daily	30 days
# $8.00	25 mg	Twice daily	30 days
# $8.00	50 mg	Twice daily	30 days
# 6	Ozempic	$40.00	0.25 mg	Once weekly	4 weeks
# $40.00	0.5 mg	Once weekly	4 weeks
# $40.00	1 mg	Once weekly	4 weeks
# 7	Bupropion	$2.50	75 mg	Once daily	21 days
# $3.00	150 mg	Once daily	21 days
# $3.50	150 mg	Twice daily	21 days

# Create frequency types
FrequencyType.find_or_create_by!(name: "Once Daily", multiplier: 1.0)
FrequencyType.find_or_create_by!(name: "Twice Daily", multiplier: 2.0)
FrequencyType.find_or_create_by!(name: "Thrice Daily", multiplier: 3.0)
FrequencyType.find_or_create_by!(name: "Four Times Daily", multiplier: 4.0)
FrequencyType.find_or_create_by!(name: "Once Weekly", multiplier: 1/7.0)
FrequencyType.find_or_create_by!(name: "Twice Weekly", multiplier: 2/7.0)
FrequencyType.find_or_create_by!(name: "Thrice Weekly", multiplier: 3/7.0)
FrequencyType.find_or_create_by!(name: "Four Times Weekly", multiplier: 4/7.0)
FrequencyType.find_or_create_by!(name: "Once Fortnightly", multiplier: 1/14.0)
FrequencyType.find_or_create_by!(name: "Twice Fortnightly", multiplier: 2/14.0)
FrequencyType.find_or_create_by!(name: "Thrice Fortnightly", multiplier: 3/14.0)
FrequencyType.find_or_create_by!(name: "Once Monthly", multiplier: 1/30.0)

# Create medications
medications = {
  Metformin: [
      { unit_price: 5.00, amount: 500.00, frequency: "Once Daily", default_duration: 30 },
      { unit_price: 5.00, amount: 500.00, frequency: "Twice Daily", default_duration: 30 },
      { unit_price: 5.00, amount: 1000.00, frequency: "Once Daily", default_duration: 30 }
    ],
  Phentermine: [
      { unit_price: 15.00, amount: 15.00, frequency: "Once Daily", default_duration: 14 },
      { unit_price: 15.00, amount: 30.00, frequency: "Once Daily", default_duration: 14 },
      { unit_price: 15.00, amount: 37.50, frequency: "Once Daily", default_duration: 14 }
  ],
  Naltrexone: [
      { unit_price: 12.00, amount: 25.00, frequency: "Once Daily", default_duration: 7 },
      { unit_price: 12.00, amount: 50.00, frequency: "Once Daily", default_duration: 28 },
      { unit_price: 12.00, amount: 50.00, frequency: "Twice Daily", default_duration: 28 }
  ],
  Wellbutrin: [
      { unit_price: 10.00, amount: 100.00, frequency: "Twice Daily", default_duration: 14 },
      { unit_price: 10.00, amount: 150.00, frequency: "Once Daily", default_duration: 14 },
      { unit_price: 10.00, amount: 150.00, frequency: "Twice Daily", default_duration: 14 }
  ],
  Topiramate: [
      { unit_price: 8.00, amount: 25.00, frequency: "Once Daily", default_duration: 30 },
      { unit_price: 8.00, amount: 25.00, frequency: "Twice Daily", default_duration: 30 },
      { unit_price: 8.00, amount: 50.00, frequency: "Twice Daily", default_duration: 30 }
  ],
  Ozempic: [
      { unit_price: 40.00, amount: 0.25, frequency: "Once Weekly", default_duration: 4 },
      { unit_price: 40.00, amount: 0.5, frequency: "Once Weekly", default_duration: 4 },
      { unit_price: 40.00, amount: 1.0, frequency: "Once Weekly", default_duration: 4 }
  ],
  Bupropion: [
      { unit_price: 2.50, amount: 75.00, frequency: "Once Daily", default_duration: 21 },
      { unit_price: 3.00, amount: 150.00, frequency: "Once Daily", default_duration: 21 },
      { unit_price: 3.50, amount: 150.00, frequency: "Twice Daily", default_duration: 21 }
  ]
}

medications.each_pair do |medication_name, dosages|
  dosages.each do |dosage|
    medication = Medication.find_or_create_by!(name: medication_name.to_s, unit_price: dosage[:unit_price])
    frequency_type = FrequencyType.find_by(name: dosage[:frequency])
    Dosage.find_or_create_by!(
      medication: medication,
      frequency_type: frequency_type,
      amount: dosage[:amount],
      unit: "mg",
      default_duration: dosage[:default_duration]
    )
  end
end
