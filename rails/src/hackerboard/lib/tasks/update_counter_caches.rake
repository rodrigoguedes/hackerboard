desc "Update all counter caches"
task :update_counter_cache => :environment do
  updater = ->(model, counter) {
    model.find_each do |record|
      model.reset_counters record.id, counter
    end
  }

  updater[Question, :replies]
  updater[Category, :questions]
end