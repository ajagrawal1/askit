class Question < ApplicationRecord
  belongs_to :user
  has_many :answer
  has_many :comment, :as => :commentable
  mount_uploader :image, ImageUploader
end
