class Recruit < ApplicationRecord
  has_many :job_applications
  has_many :applied_users, class_name: "User", through: :job_applications
  has_many :favorites
  has_many :favorite_users, class_name: "User", through: :favorites
  belongs_to :company
  has_many :recruit_images
  accepts_nested_attributes_for :recruit_images

  validates :occupation, presence: true
  validates :description, presence: true
  validates :qualification, presence: true
  validates :employment_type, presence: true
  validates :salary, presence: true
  validates :welfare, presence: true
  validates :office_hours, presence: true
  validates :holiday, presence: true
  validates :location, presence: true
  validates :consideration, presence: true
  validates :screening_process, presence: true
  validates :job_summary, presence: true
  validates :job_description, presence: true

  # def self.search_recruits params
  #   where('location like params', params: "%#{'a'}%")
  # end

end
