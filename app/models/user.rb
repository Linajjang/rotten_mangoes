class User < ApplicationRecord::Base

  has_many :reviews
  
  def has_secure_password

  end

end
