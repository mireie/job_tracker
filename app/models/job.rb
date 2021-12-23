class Job < ApplicationRecord
  @@active_statuses = ['Applied','Interviewing','Have Not Applied','Other']
  
  scope :active, -> { where(status: @@active_statuses) }
  scope :inactive, -> { where.not(status: @@active_statuses) }
  scope :this_week, -> { where("submission_date >=?", Date.today.beginning_of_week)}
  scope :last_week, -> { where("submission_date BETWEEN ? AND ?", Date.today.prev_occurring(:monday).prev_occurring(:monday), Date.today.beginning_of_week)}
  scope :ignored, -> { where(status: 'Applied').where("submission_date < ?", 1.month.ago) }

  validates :company, :title, :url, presence: true

  belongs_to :user
  has_many :notes, dependent: :destroy
end
