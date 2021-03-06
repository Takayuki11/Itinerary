class Place < ApplicationRecord
  belongs_to :user
  
  has_many :pictures,  dependent: :destroy
  accepts_nested_attributes_for :pictures
end