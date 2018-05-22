class TaskCategory < ApplicationRecord
  has_many :gazelle_capability_logs
  has_many :gazelle_runners, through: :gazelle_capability_logs
  has_many :tasks
  validates :name, presence: true, :inclusion => { :in => ["Pick and Drop",  "Office"]}
end
