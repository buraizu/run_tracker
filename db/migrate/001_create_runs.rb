class CreateRuns < ActiveRecord::Migration[5.0]
  def change

    create_table :runners do |t|
      t.string :username
      t.string :password_digest
    end

    create_table :events do |t|
      t.string :description
    end

    create_table :runs do |t|
      t.belongs_to :runner, index: true
      t.string :course
      t.float :distance
      t.integer :time
      t.text :review
      t.integer :rating
    end

    create_table :runner_events do |t|
      t.belongs_to :runner, index: true
      t.belongs_to :event, index: true
      t.boolean :completed
      t.integer :finish_time
    end

  end
end
