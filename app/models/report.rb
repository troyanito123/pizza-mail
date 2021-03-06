class Report < ApplicationRecord

  enum status: [ :ready, :queue, :done, :error ]
  enum prevalence: [ :daily, :weekly, :monthly, :custom ]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 2,maximum: 250},
            format: {with: VALID_EMAIL_REGEX}
  validates :day, presence: true
  validate :prevalence_validate


  scope :on, ->{ where("state = ?", true) }

  def prevalence_validate
    if custom? && days.nil?
      errors.add(:prevalence, "You need to supply at least one day")
    end
  end

end
