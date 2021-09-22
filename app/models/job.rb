class Job < ApplicationRecord
  scope :active, -> { where(status: 'Applied') }
  scope :inactive, -> { where.not(status: 'Applied') }
end
