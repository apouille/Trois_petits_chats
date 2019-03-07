class Admin::AdminController < AdminController

	def index
		@users = User.all
	end
end
