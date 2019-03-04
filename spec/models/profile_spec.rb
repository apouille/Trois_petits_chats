require 'rails_helper'

RSpec.describe Profile, type: :model do

  before(:each) do 
    @profile = FactoryBot.create(:profile)    
  end

  it "has a valid factory" do
    expect(build(:profile)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@profile).to be_a(Profile)
    end

    describe "#first_name" do
    	it { expect(@profile).to validate_presence_of(:first_name) }
		end
		describe "#last_name" do
    	it { expect(@profile).to validate_presence_of(:last_name) }
		end
		describe "#street" do
    	it { expect(@profile).to validate_presence_of(:street) }
		end
		describe "#city" do
    	it { expect(@profile).to validate_presence_of(:city) }
		end
		describe "#zip_code" do
    	it { expect(@profile).to validate_presence_of(:zip_code) }
    	it { is_expected.to allow_value("2a004").for(:zip_code) }
      it { is_expected.to allow_value("2A004").for(:zip_code) }
      it { is_expected.to allow_value("95600").for(:zip_code) }
      it { is_expected.to_not allow_value("100000").for(:zip_code) }
      it { is_expected.to_not allow_value("0000").for(:zip_code) }
		end
		describe "#phone_number" do
    	it { expect(@profile).to validate_presence_of(:phone_number) }
    	it { is_expected.to allow_value("0610261513").for(:phone_number) }
      it { is_expected.to allow_value("0720267214").for(:phone_number) }
      it { is_expected.to allow_value("0033610261513").for(:phone_number) }
      it { is_expected.to_not allow_value("1133610261513").for(:phone_number) }
      it { is_expected.to_not allow_value("0000").for(:phone_number) }
		end
  end
  
  context "associations" do
    it { expect(@profile).to belong_to(:user) }
  end

end
