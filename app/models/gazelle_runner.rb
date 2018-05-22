class GazelleRunner < ApplicationRecord
  belongs_to :user
  has_many :task_categories, through: :gazelle_capability_logs

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  mount_uploader :photo, PhotoUploader

end
