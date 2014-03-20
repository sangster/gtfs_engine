class CreateGtfsEngineCalendars < ActiveRecord::Migration
  TABLE = :gtfs_engine_calendars

  def change
    create_table TABLE do |t|
      t.string :service_id, null: false
      t.boolean :monday, null: false
      t.boolean :tuesday, null: false
      t.boolean :wednesday, null: false
      t.boolean :thursday, null: false
      t.boolean :friday, null: false
      t.boolean :saturday, null: false
      t.boolean :sunday, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.datetime :created_at, null: false
    end
  end
end
