class Task < ApplicationRecord
  belongs_to :company
  belongs_to :gazelle_runner
  belongs_to :task_category
  belongs_to :first_location, class_name: 'Location', foreign_key: 'first_location_id'
  belongs_to :second_location, class_name: 'Location', foreign_key: 'second_location_id'

  validates :cost_per_hour, presence: true, numericality: true
  validates :task_time, presence: true, numericality: true
  validates :task_category, presence: true
  validate :category_location_checker

  def category_location_checker
      # this method is to explain the number of geolocations required for the two
      # two types of tasks;
      # 1) Pick and Drop; requires two locations
      # 2) office tasks; only require one location
      if task_category.name == "Pick and Drop" &&  first_location_id == nil
        errors.add(:first_location_id, "Pick up location required for task")
      elsif task_category.name == "Pick and Drop" &&  second_location_id == nil
        errors.add(:second_location_id, "Drop off location required for task")
      elsif task_category.name == "Office" && first_off_location_id == nil
        errors.add(:first_location_id, "Office location required for task")
    end
  end
end

