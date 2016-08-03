class Renter < ActiveRecord::Base
  belongs_to :user
  has_many :contracts
  
  def fullname
    "#{name} #{surname}"
  end
end
