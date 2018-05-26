class AddYearToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :year, foreign_key: true
  end
end
