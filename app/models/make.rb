class Make < ActiveRecord::Base
  belongs_to :user
  has_many :models
  has_many :assets
end
