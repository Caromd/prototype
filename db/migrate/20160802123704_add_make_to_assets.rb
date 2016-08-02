class AddMakeToAssets < ActiveRecord::Migration
  def change
    add_reference :assets, :make, index: true, foreign_key: true
  end
end
