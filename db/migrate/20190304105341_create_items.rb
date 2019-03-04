class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :image_url
      t.string :author
      t.string :format
      t.integer :view

      t.timestamps
    end
  end
end
