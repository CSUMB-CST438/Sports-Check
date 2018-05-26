class RemoveLevelFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :level, :string
  end
end
