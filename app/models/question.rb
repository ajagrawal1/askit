class Question < ApplicationRecord
  belongs_to :user
  has_many :answer
  mount_uploader :image, ImageUploader
end
