class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 225
      t.string :last_name, null: false, limit: 225
      t.string :email, null: false, limit: 225
      t.references :role, index: true, foreign_key: true

      t.timestamps
    end
  end
end
