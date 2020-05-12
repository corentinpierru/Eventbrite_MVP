class Removeuser < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :user, index: true
  end
end
