class Company < ApplicationRecord
  has_many :recruit

  validates :name, presence: true
  validates :description, presence: true
  validates :establishment_date, presence: true
  validates :representative, presence: true
  validates :employees, presence: true
  validates :capital, presence: true
  validates :business, presence: true
end
