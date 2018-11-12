class AddCounterCacheToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :movies_count, :integer, default: 0

    Rake::Task['counters:reset:genre'].invoke
  end
end
