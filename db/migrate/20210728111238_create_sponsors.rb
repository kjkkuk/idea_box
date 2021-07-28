class CreateSponsors < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsors do |t|
      t.string :industry, null: false
      t.string :geo, null: false
      t.string :opportunity, null: false

      t.timestamps
    end
  end
end
