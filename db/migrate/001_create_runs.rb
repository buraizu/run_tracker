class CreateRuns < ActiveRecord::Migration[5.0]
  def change

    create_table :runners do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
    end

    create_table :goals do |t|
      t.string :description
      t.boolean :completed
    end

    create_table :runs do |t|
      t.belongs_to :runner, index: true
      t.belongs_to :goal, index: true
      t.string :course
      t.float :distance
      t.integer :time
      t.text :review
      t.integer :rating
      t.string :difficulty
    end

  end
end
