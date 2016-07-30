class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :asset
  belongs_to :renter
  has_many :odometers
end
