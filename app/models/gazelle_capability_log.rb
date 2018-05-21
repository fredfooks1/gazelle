class GazelleCapabilityLog < ApplicationRecord
  belongs_to :gazelle_runner, dependent: :destroy
  belongs_to :task_category, dependent: :destroy

end
