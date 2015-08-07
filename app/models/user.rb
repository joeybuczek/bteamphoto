class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_one :wedding, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :webgalleries, dependent: :destroy
  
  # User roles
  def admin?
    role == 'admin'
  end
  
  def client?
    role == 'client'
  end
  
end
