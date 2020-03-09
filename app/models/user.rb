class User < ApplicationRecord

  has_many :pizzas

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {minimum: 2, maximum: 250}
  validates :email, presence: true, uniqueness: true, length: {minimum: 2,maximum: 250},
            format: {with: VALID_EMAIL_REGEX}
  validates :address, presence: true, length: {minimum: 2, maximum: 250}
  validates :password, length: {minimum: 5}, allow_blank: true

end
