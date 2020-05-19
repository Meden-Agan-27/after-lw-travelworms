class Tag < ApplicationRecord
  validates_presence_of :tag_name
  validates_uniqueness_of :tag_name, case_sensitive: false
  has_many :book_tags
  has_many :books, through: :book_tags

end
