class Admin::AdminController < AdminController

	def index
		@users = User.all
		@items = Item.all
	end
end
