class CreateTimeRecords < ActiveRecord::Migration
  def change
    create_table :time_records do |t|
      t.date :day
      t.integer :hour
      t.integer :quarter
      t.string :event
      t.text :note

      t.timestamps
    end
  end
end
