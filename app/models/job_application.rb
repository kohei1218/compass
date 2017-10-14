class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :recruit
end
