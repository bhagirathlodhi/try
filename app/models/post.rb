class Post < ApplicationRecord
  self.per_page = 5
  #WillPaginate.per_page = 3

  has_one_attached :image
  has_many :comments
  belongs_to :user
end
