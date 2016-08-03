class Model < ActiveRecord::Base
  belongs_to :user
  belongs_to :make
  has_many :assets
end
