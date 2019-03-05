class Cart < ApplicationRecord
	enum status: { in_progress:0, paid:1 }

	belongs_to :user
	has_many :cart_items
end
