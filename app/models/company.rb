class Company < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, presence: true, uniqueness: true


end
