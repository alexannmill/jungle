class User < ApplicationRecord
  
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true, length: {minimum: 8}

  def self.authenticate_with_credentials (email, password)
    # set user with email, 
    # strip away extra spaces and downcase all letters in email
    @user = User.find_by_email(email.strip.downcase)
    # auth with email and password
    if @user && @user.authenticate(password)
      return @user 
    else
      return nil
    end
  end
end
