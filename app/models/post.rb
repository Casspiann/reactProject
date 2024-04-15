class Post < ApplicationRecord
    has_one_attached :image
    validates :title, :description, presence: true
end
  