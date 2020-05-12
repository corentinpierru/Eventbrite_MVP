class RemoveUserfromparticipation < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participations, :user, index: true
  end
end
