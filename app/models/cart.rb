class Cart < ApplicationRecord
	enum status: { in_progress:0, paid:1 }
end
