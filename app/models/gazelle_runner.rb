class GazelleRunner < ApplicationRecord
  belongs_to :user
  has_many :task_categories, through: :gazelle_capability_logs
  has_many :tasks

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :description,  presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
