class Day < ApplicationRecord
  has_many :report_days
  has_many :reports, through: :report_days
end
