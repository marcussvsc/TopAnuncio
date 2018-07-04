class Category < ApplicationRecord
  has_many :announcements
  validates_presence_of :description
end
