class Job < ApplicationRecord
  @@active_statuses = ['Applied','Interviewing','Have Not Applied','Other']
  
  scope :active, -> { where(status: @@active_statuses) }
  scope :inactive, -> { where.not(status: @@active_statuses) }
  scope :this_week, -> { where("created_at >=?", Date.today.beginning_of_week)}
  scope :last_week, -> { where("created_at BETWEEN ? AND ?", Date.today.prev_occurring(:monday).prev_occurring(:monday), Date.today.beginning_of_week)}

  validates :company, :title, :url, presence: true

  belongs_to :user
end
