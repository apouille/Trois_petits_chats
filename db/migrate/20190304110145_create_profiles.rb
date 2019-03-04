class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :street
    	t.string :city
    	t.string :zip_code
    	t.string :phone_number
      t.timestamps
    end
  end
end
