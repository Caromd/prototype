class AddModelToAssets < ActiveRecord::Migration
  def change
    add_reference :assets, :model, index: true, foreign_key: true
  end
end
