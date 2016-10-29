class Member < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :shops
  mount_uploader :image, ImageUploader
  
  before_validation do
   self.email_for_index = email.downcase if email
  end

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

end
