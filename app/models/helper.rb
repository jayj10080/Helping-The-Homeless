class Helper < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: { minimum: 3 }
end
