class LineType < ActiveRecord::Base
  belongs_to :user
  def type_and_description
    "#{line_type} #{description}"
  end
end
