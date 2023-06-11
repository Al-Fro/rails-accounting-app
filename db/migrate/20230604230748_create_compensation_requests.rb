class CreateCompensationRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :compensation_requests do |t|
      t.references :actor, polymorphic: true, null: false
      t.decimal :amount
      t.string :reason
      t.string :currency
      t.string :status

      t.timestamps
    end
  end
end
