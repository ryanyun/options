class Contract < ActiveRecord::Base
  include AASM

  belongs_to :seller, foreign_key: :seller_id, class_name: 'User'
  belongs_to :buyer, foreign_key: :buyer_id, class_name: 'User'
  has_many :bids, dependent: :destroy

  scope :available, -> { where(status: ['listed', 'pending', 'accepted']) }

  aasm column: :status do
    state :listed, initial: true
    state :pending
    state :accepted
    state :confirmed
    state :secured
    state :finalized

    event :pend do
      transitions from: :listed, to: :pending
    end

    event :accept do
      transitions from: :pending, to: :accepted
    end

    event :confirmed do
      transitions from: :accepted, to: :confirmed
    end

    event :secure do
      transitions from: :confirmed, to: :secured
    end

    event :finalize do
      transitions from: :secured, to: :finalized
    end
  end
end
