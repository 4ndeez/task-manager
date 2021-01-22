class Task < ApplicationRecord
  belongs_to :user
  enum status: { 'New': 0, 'In progress': 1, 'Done': 2 }

  validates :title, length: { minimum: 3 }
  validates :description, presence: true
  validates :status, inclusion: { in: Task.statuses.keys }
  validates :user_id, presence: true
end
