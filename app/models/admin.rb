class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_confirmation_of :password, :password_confirmation
  validates_presence_of :email, :password, :password_confirmation
end
