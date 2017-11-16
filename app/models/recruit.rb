class Recruit < ApplicationRecord
  has_many :job_applications
  has_many :applied_users, class_name: "User", through: :job_applications
  has_many :favorites
  has_many :favorite_users, class_name: "User", through: :favorites
  belongs_to :company
  has_many :recruit_images

  attr_accessor :isFavorite
  validates :occupation, presence: true
end
