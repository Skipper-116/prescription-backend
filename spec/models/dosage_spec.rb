require 'rails_helper'

RSpec.describe Dosage, type: :model do
  it "should have a valid factory" do
    expect(FactoryBot.build(:dosage)).to be_valid
  end

  describe "ActiveRecord associations" do
    it { is_expected.to belong_to(:medication) }
    it { is_expected.to belong_to(:frequency_type) }
    it { is_expected.to have_many(:prescription_dosages) }
  end

  describe "ActiveRecord validations" do
    it { is_expected.to validate_presence_of(:medication) }
    it { is_expected.to validate_presence_of(:frequency_type) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:unit) }
    it { is_expected.to validate_presence_of(:default_duration) }
  end
end
