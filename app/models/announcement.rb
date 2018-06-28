class Announcement < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
end
