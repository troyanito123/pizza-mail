class Pizza < ApplicationRecord

  belongs_to :size
  belongs_to :user

  has_many :pizza_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_ingredients

  scope :daily, ->{where("created_at BETWEEN ? AND ?", Time.new.beginning_of_day, Time.new.end_of_day)}
  scope :weekly, ->{where("created_at BETWEEN ? AND ?", Time.new.beginning_of_week, Time.new.end_of_week)}
  scope :monthly, ->{where("created_at BETWEEN ? AND ?", Time.new.beginning_of_month, Time.new.end_of_month)}


end
