class CreateGtfsEngineCalendarDates < ActiveRecord::Migration
  TABLE = :gtfs_engine_calendar_dates

  def change
    create_table TABLE do |t|
      t.string :service_id, null: false
      t.date :date, null: false
      t.integer :exception_type, null: false

      t.datetime :created_at, null: false
    end

    add_index TABLE, :service_id
  end
end
