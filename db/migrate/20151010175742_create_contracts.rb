class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.string :address
      t.float :amount
      t.float :price
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.boolean :buyer_confirmed?
      t.boolean :seller_confirmed?
      t.timestamps null: false
    end
  end
end
