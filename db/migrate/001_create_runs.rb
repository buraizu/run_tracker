class CreateRuns < ActiveRecord::Migration[5.0]
  def change

    create_table :runners do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
    end

    create_table :goals do |t|
      t.string :description
    end

    create_table :followups do |t|
      t.text :course_review
      t.integer :course_rating
      t.integer :soreness
    end

    create_table :runs do |t|
      t.belongs_to :runner, index: true
      t.belongs_to :goal, index: true
      t.belongs_to :followup, index: true
      t.float :distance
      t.text :course
    end

  end
end
