class Picture < ApplicationRecord
  belongs_to :place
  
  mount_uploader :file, ImageUploader
end
