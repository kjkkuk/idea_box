class AddUserToSponsor < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :sponsor, index: true, foreign_key: true
  end
end
