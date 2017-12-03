class Recruit < ApplicationRecord
  has_many :job_applications
  has_many :applied_users, class_name: "User", through: :job_applications
  has_many :favorites
  has_many :favorite_users, class_name: "User", through: :favorites
  belongs_to :company
  has_many :recruit_images
  accepts_nested_attributes_for :recruit_images

  # validates :occupation, presence: true

  def self.search_recruits params
    where('location like params', params: "%#{'a'}%")
  end

end
