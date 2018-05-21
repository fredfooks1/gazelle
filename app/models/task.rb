class Task < ApplicationRecord
  belongs_to :company, dependent: :destroy
  belongs_to :gazelle_runner
  belongs_to :task_category, dependent: :destroy
  belongs_to :pick_up_location, class_name: 'Location', foreign_key: 'pick_up_location_id'
  belongs_to :drop_off_location, class_name: 'Location', foreign_key: 'drop_off_location_id'

  validates :cost_per_hour, presence: true, numericality: true
  validates :time, presence: true, numericality: true
  validates :category_location_checker

  def category_location_checker
    if task_category == "pick up" || task_category =="drop off" && pick_up_location_id == nil
      errors.add(:pick_up_location_id, "Pick up location required for task")
    elsif task_category == "pick_up" || task_category =="drop off" && drop_off_location == nil
      errors.add(:drop_off_location_id, "Final location required for task")
    elsif task_category == "office" drop_ff_location_id == nil
      errors.add(:drop_off_location_id, "Office location required for task")
    end
end
