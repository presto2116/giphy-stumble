class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :interests
  has_many :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
