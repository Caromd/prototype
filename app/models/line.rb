class Line < ActiveRecord::Base
  belongs_to :user
  belongs_to :invoice
  belongs_to :line_type
end
