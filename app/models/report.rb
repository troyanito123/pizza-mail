class Report < ApplicationRecord

  has_many :report_days, dependent: :destroy
  has_many :days, through: :report_days

  enum status: [ :ready, :queue, :done, :error ]
  enum prevalence: [ :daily, :weekly, :monthly, :custom ]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 2,maximum: 250},
            format: {with: VALID_EMAIL_REGEX}
  validates :day, presence: true
  validate :prevalence_validate


  scope :on, ->{ where("state = ?", true) }
  scope :daily, ->{ where("prevalence = ?", prevalences[:daily]) }
  scope :weekly, ->{ where("prevalence = ?", prevalences[:weekly]) }
  scope :monthly, ->{ where("prevalence = ?", prevalences[:monthly]) }
  scope :custom, ->{ where("prevalence = ?", prevalences[:custom]) }

  def prevalence_validate
    if custom? && days.empty?
      errors.add(:prevalence, "You need to supply at least one day")
    end
  end

end
