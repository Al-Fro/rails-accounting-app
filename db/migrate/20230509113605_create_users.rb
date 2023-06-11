class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :actor, polymorphic: true, null: false
      t.string :email
      t.string :password
      t.string :google_id

      t.timestamps
    end
  end
end
