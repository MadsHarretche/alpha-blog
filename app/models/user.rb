class User < ApplicationRecord
#self referer hver enkelt objekt af user class, så når det kommer til email-feltet, så vil et enhvert objekt
#blive downcased inden det bliver saved
    before_save { self.email = email.downcase }
    has_many :articles  
    validates :username, presence:true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGAX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGAX }
  has_secure_password
end
