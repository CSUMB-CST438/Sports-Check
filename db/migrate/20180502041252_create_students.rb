class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string  :name
      t.integer :school_year, defalut: 1
      t.float   :gpa, default: 2.0
      t.integer :attendance, default: 0
      t.boolean :physical
      t.boolean :concussion
      t.boolean :cardiac
      t.boolean :c_o_ethics
      t.boolean :doctor_note, default: true
      t.string  :sport
      t.string  :level
      t.timestamps
    end
  end
end
