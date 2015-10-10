class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:coinbase]

  has_many :contracts, foreign_key: :seller_id, class_name: 'Contract'
  has_many :bids, through: :contracts

  validates :uid, presence: true, uniqueness: { case_sensitive: false }

  class << self
    def from_omniauth(auth)
      found_user = self.find_by(uid: auth.uid)

      if found_user.present?
        found_user.update_attributes(
          uid: auth.uid, provider: auth.provider,
          oauth_token: auth.credentials.token,
          oauth_expires_at: Time.at(auth.credentials.expires_at)
        )
        found_user
      else
        first_name = auth.info.name.split.first
        last_name  = auth.info.name.split.last
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.password = Devise.friendly_token[0,20]
          user.first_name = first_name
          user.last_name = last_name
          user.uid = auth.uid
          user.provider = auth.provider
          user.oauth_token = auth.credentials.token
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        end
      end
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.coinbase_data"] && session["devise.coinbase_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

  def fullname
    "#{first_name} #{last_name}"
  end

  def have_offers?
    bids.exists?
  end

  def email_required?
    false
  end
end
