class Announcement < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  belongs_to :user
  belongs_to :category
  validates_presence_of :title, :description, :price
end
