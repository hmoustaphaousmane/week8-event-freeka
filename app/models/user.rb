class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances
  has_many :events, through: :attendances

  # Send a welcome to the user after its creation
  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now  
  end
end
