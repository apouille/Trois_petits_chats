require 'rails_helper'

RSpec.describe Item, type: :model do
	before(:each) do 
    @item = FactoryBot.create(:item)    
  end

  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@item).to be_a(Item)
    end

    describe "#image_url" do
    	it { expect(@item).to validate_presence_of(:image_url).with_message("Merci de remplir tous les champs obligatoires!") }
		end

		describe "#title" do
    	it { expect(@item).to validate_presence_of(:title).with_message("Merci de remplir tous les champs obligatoires!") }
		end

		describe "#description" do
      it { expect(@item).to validate_presence_of(:description).with_message("Merci de remplir tous les champs obligatoires!") }
      it { expect(@item).to validate_length_of(:description).is_at_least(20).with_message("La description doit faire au minimum 20 caractères") }
		end

		describe "#price" do
      it { expect(@item).to validate_presence_of(:price).with_message("Merci de remplir tous les champs obligatoires!") }
      it { expect(@item).to validate_numericality_of(:price).is_greater_than(0).with_message("Le prix doit être supérieur à 0") }
		end
  end

  context "associations" do
  end



end
