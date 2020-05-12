class Removeadministrator < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participations, :administrator, index: true
  end
end
