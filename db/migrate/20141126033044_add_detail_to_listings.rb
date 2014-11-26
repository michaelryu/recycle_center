class AddDetailToListings < ActiveRecord::Migration
  def change
    add_column :listings, :detail, :text
  end
end
