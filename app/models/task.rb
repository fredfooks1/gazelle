class Task < ApplicationRecord
  belongs_to :company
  belongs_to :gazelle_runner, optional: true

  belongs_to :task_category, optional: true
  belongs_to :first_location, class_name: 'Location', foreign_key: 'first_location_id', autosave: true
  belongs_to :second_location, class_name: 'Location', foreign_key: 'second_location_id', optional: true, autosave: true


  validates :description, presence: true, uniqueness: { scope: :company }

  validates :cost_per_hour, presence: true, numericality: true
  validates :task_time, presence: true, numericality: true
  validates :title, presence: true

  # def second_location_needed?
  #   task_category.name != "Office"
  # end
end

