class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :bidder_id
      t.integer :contract_id
      t.boolean :seller_confirmed?, :default => false
      t.timestamps null: false
    end
  end
end
