class Company < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :locations
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    where("tasks ILIKE ?", "%#{search}%")
  end

end
