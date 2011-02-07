class User < ActiveRecord::Base

  devise :database_authenticatable, :omniauthable
  attr_accessible :email

  has_many :posts, foreign_key: :author_id
  has_many :user_tokens

  def self.find_for_twitter_oauth(omniauth)
    authentication = UserToken.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication && authentication.user
      authentication.user
    else
      User.new
      # In a typical app you would create a new user here:
      # User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end 

end
