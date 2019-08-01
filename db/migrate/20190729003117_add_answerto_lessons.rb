class AddAnswertoLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :answer, :text
  end
end
