class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :done, default: false
      t.date :task_start
      t.date :task_finish
      t.belongs_to :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
