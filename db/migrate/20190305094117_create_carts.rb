class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :stripe_customer_id
      t.integer :status
      t.belongs_to :user, index:true
      t.timestamps
    end
  end
end
