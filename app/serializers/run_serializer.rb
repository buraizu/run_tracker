class RunSerializer < ActiveModel::Serializer
  attributes :id, :course, :distance, :time, :review, :rating
  belongs_to :runner
end

t.integer "runner_id"
t.string "course"
t.float "distance"
t.integer "time"
t.text "review"
t.integer "rating"
t.index ["runner_id"], name: "index_runs_on_runner_id"
