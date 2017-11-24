class User < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_many :items

  # why do I need this if I make the association above
  # validates_associated :events,

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
  # :confirmable, :lockable, :timeoutable, :confirmable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
