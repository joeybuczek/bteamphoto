class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  # User roles
  def admin?
    role == 'admin'
  end
  
  def client?
    role == 'client'
  end
  
  def guest?
    role == 'guest'
  end
  
end
