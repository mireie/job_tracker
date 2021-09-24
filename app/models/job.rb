class Job < ApplicationRecord
  scope :active, -> { where(status: 'Applied') }
  scope :inactive, -> { where.not(status: 'Applied') }
  scope :recent, -> { where("created_at >=?", 1.week.ago)}
end
