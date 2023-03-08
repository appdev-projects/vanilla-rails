class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :tasks, class_name: "Task", foreign_key: "commenter_id", dependent: :destroy

  #validates #:username,
  #  presence: true,
  #  uniqueness: true,
  #  format: { 
  #    with: /\A[\w_\.]+\z/i,
  #    message: "can only contain letters, numbers, periods, and underscores"
  #  }


  def ensure_website_has_scheme
    if website.present? &&
      !website.starts_with?("http://") &&
      !website.starts_with?("https://")

      self.website = "http://" + self.website
    end
  end
end
