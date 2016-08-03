class Asset < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner
  has_many :contracts
  belongs_to :make
  belongs_to :model
end
