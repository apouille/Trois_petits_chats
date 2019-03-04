class Profile < ApplicationRecord
	belongs_to :user

	validates :first_name, presence:true
	validates :last_name, presence:true
	validates :street, presence:true 
	validates :city, presence:true
	validates :zip_code,
		presence:true,
		format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[abAB]))[0-9]{3}\z/, message: "code postal invalide" }

	validates :phone_number, 
		presence:true,
		format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "entrez un numéro français s'il vous plait" }

end
