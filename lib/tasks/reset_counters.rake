namespace :counters do
  namespace :reset do

    task :genre => :environment do
      Genre.all.each { |genre| Genre.reset_counters(genre.id, :movies) }
    end

    task :user => :environment do
      User.all.each { |user| User.reset_counters(user.id, :comments) }
    end

  end
end
