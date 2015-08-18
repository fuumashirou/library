class AddEditorialIdToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :editorial_id, :integer
  end
end
