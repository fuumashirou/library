class RemoveEditorialFromBooks < ActiveRecord::Migration
  def change
		remove_column :books, :editorial
  end
end
