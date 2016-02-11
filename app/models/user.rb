class User < ActiveRecord::Base
  has_many :meetings
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum:8 }
  
  
  def self.authenticate (email, password)
      user = find_by_email(email)
      
      
      return user if user != nil && password == user.password
      
      return nil
    end
end
