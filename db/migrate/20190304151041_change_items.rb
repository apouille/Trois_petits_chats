class ChangeItems < ActiveRecord::Migration[5.2]
  def change
  	remove_column :items, :format, :string;
  	add_column :items, :dimension, :string
  end
end
