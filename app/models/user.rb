class User < ActiveRecord::Base
  has_many :events
  has_and_belongs_to_many :guestlists#, through: :events
  has_many :items

  validates_associated :events, :guestlists

  def self.create_from_omniauth(params)
    attributes = {
      first_name: params['info']['first_name'],
      last_name: params['info']['last_name'],
      email: params['info']['email'],
      password: Devise.friendly_token,
    }

    create(attributes)
  end

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
