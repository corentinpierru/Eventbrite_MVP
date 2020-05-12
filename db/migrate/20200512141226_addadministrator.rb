class Addadministrator < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :administrator, index: true
  end
end
