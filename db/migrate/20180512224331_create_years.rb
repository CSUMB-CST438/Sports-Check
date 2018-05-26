class CreateYears < ActiveRecord::Migration[5.2]
  def change
    create_table :years do |t|
      t.integer :number
      t.integer :school_id
      t.timestamps
    end
  end
end
