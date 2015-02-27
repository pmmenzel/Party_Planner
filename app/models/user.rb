class User < ActiveRecord::Base
  has_many :events
  has_and_belongs_to_many :guestlist

  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token,
    }

    create(attributes)
  end

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end



# class Picture < ActiveRecord::Base
#   belongs_to :imageable, polymorphic: true
# end

# class Employee < ActiveRecord::Base
#   has_many :pictures, as: :imageable
# end

# class Product < ActiveRecord::Base
#   has_many :pictures, as: :imageable
# end