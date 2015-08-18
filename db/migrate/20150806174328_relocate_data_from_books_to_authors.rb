class RelocateDataFromBooksToAuthors < ActiveRecord::Migration
  
  def up
  	Book.all.each do |book|
  		author = Author.find_or_create_by(:name => book.author, :book_id => book.id)
     	book.author_id = author.id
     	book.save
		end 
  end

  def down
  end
end
