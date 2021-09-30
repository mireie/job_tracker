class Job < ApplicationRecord
  scope :active, -> { where(status: 'Applied') }
  scope :inactive, -> { where.not(status: 'Applied') }
  scope :recent, -> { where("created_at >=?", Date.today.beginning_of_week)}
end
