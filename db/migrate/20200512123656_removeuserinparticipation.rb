class Removeuserinparticipation < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participations, :user, index: true, foreign_key: true
  end
end
