class Job < ApplicationRecord
  scope :active, -> { where(status: 'Applied') }
  scope :inactive, -> { where.not(status: 'Applied') }
  scope :this_week, -> { where("created_at >=?", Date.today.beginning_of_week)}
  scope :last_week, -> { where("created_at BETWEEN ? AND ?", Date.today.prev_occurring(:monday).prev_occurring(:monday), Date.today.beginning_of_week)}
end
