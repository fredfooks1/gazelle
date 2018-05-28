class Company < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :locations
  validates :name, presence: true, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(search)
    where("tasks ILIKE ?", "%#{search}%")
  end

end
