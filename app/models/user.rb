class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :job_applications
  has_many :applied_recruits, class_name: "Recruit", through: :job_applications
  has_many :favorites
  has_many :favorite_recruits, class_name: "Recruit", through: :favorites
  has_many :view_logs
  has_many :viewed_recruits, class_name: "Recruit", through: :view_logs

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true
  validates :employed_status, presence: true
  validates :first_handicapped_part, presence: true
  validates :first_handicapped_level, presence: true
  validates :phone_or_cellphone, presence: true

  def favorite?(recruit, user_id)
    recruit.favorites.each do |favorite|
      if favorite.user_id == user_id
        return true
      end
    end
    false
  end

  def application?(recruit, user_id)
    recruit.job_applications.each do |job_application|
      if job_application.user_id == user_id
        return true
      end
    end
    false
  end

  private
    def phone_or_cellphone
      phone_number.presence or cell_phone_number.presence
    end

end
