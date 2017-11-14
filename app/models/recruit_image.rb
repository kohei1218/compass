class RecruitImage < ApplicationRecord
  belongs_to :recruit
  mount_uploader :image, ImageUploader
end
