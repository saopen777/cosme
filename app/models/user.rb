class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments

  with_options presence: true do
    validates :nickname, format: { with://, message:""}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX}
    validates :email, uniqueness: true
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
    validates :password, confirmation: true
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
  end
end
