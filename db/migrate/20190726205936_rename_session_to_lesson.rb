class RenameSessionToLesson < ActiveRecord::Migration[5.2]
  def change
    rename_table :sessions, :lessons
  end
end
