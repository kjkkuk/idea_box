class CreateSponsors < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsors do |t|
      t.string :industry
      t.string :geo
      t.string :opportunity

      t.timestamps
    end
  end
end
