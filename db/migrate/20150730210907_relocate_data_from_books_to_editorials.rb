class RelocateDataFromBooksToEditorials < ActiveRecord::Migration
  
  def up
  	Book.all.each do |book|

  		editorial = Editorial.find_or_create_by(:name => book.editorial)
      	book.editorial_id = editorial.id
      	book.save
	end 
  end

  def down
  end
end
