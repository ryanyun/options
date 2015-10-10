class Bid < ActiveRecord::Base
  belongs_to :bidder, foreign_key: :bidder_id, class_name: 'User'
  belongs_to :contract
end
