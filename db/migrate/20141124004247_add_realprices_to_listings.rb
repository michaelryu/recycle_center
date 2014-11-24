class AddRealpricesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :realprice, :string
  end
end
