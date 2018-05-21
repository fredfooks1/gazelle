class TaskCategory < ApplicationRecord
    belongs_to :gazelle_runner, through: :gazelle_capability_logs
    belongs_to :task
end
