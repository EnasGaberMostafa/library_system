class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :userName, :email, :password, :password_confirmation, presence: true

  has_many :comments
  has_many :rates


  #validates :userName, :email, :password, :password_confirmation, presence: true
  has_many :borrowed_books,    dependent: :destroy


end
