class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :contract
  has_many :lines
  accepts_nested_attributes_for :lines, reject_if: :all_blank, allow_destroy: true
end
