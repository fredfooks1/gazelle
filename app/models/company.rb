class Company < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    where("task ILIKE ?", "%#{search}%")
  end

end
