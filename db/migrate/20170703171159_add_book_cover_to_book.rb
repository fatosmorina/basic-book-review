class AddBookCoverToBook < ActiveRecord::Migration[5.1]
   def up
    add_attachment :books, :book_cover
  end

  def down
    remove_attachment :books, :book_cover
  end
end
