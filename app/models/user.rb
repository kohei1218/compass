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
end
