class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.boolean :shop_status
      t.time :morning_opens_at
      t.time :morning_closes_at
      t.time :afternoon_opens_at
      t.time :afternoon_closes_at
      t.integer :weekday
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
