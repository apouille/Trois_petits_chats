class Cart < ApplicationRecord
	enum status: { in_progress:0, paid:1 }

	has_many :cart_items
	belongs_to :user

end
