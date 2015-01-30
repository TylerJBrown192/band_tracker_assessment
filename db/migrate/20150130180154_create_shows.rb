class CreateShows < ActiveRecord::Migration
  def change
    create_table :bands_venues do |t|
      t.belongs_to :band, index: true
      t.belongs_to :venue, index: true

      t.timestamps
    end
  end
end
