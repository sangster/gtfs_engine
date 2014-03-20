class CreateGtfsEngineDataPulls < ActiveRecord::Migration
  TABLE = :gtfs_engine_data_pulls

  def change
    create_table TABLE do |t|
      t.string :url, null: false
      t.string :etag

      t.datetime :created_at, null: false
    end

    add_index TABLE, :url
  end
end
