class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.references :user, index: true

      t.timestamps
    end
  end
end
