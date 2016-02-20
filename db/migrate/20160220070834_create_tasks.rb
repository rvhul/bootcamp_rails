class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status, default: Task::StatusTask::NOT_STARTED

      t.timestamps null: false
    end
  end
end
