class Model < ActiveRecord::Base
  belongs_to :user
  belongs_to :make
end
