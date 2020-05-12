class Addclassofusertoparticipation < ActiveRecord::Migration[6.0]
  def change
    add_reference :participations, :administrator, index: true
    add_reference :participations, :attendee, index: true
  end
end
