class Category < ApplicationRecord
  belongs_to :books, optional: true
end
