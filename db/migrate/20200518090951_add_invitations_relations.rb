class AddInvitationsRelations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invitations, :users, column: :attendee_id
    add_foreign_key :invitations, :events, column: :attended_event_id
    add_foreign_key :invitations, :users, column: :host_id
  end
end
