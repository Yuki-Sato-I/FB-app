class Post < ApplicationRecord
  mount_uploader :image, PostUploader
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence:true
  validates :content, presence:true
end
