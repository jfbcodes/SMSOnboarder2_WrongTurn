class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :email
      t.string :phone
      t.string :authy_identifier

      t.timestamps
    end
  end
end
