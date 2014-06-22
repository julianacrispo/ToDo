every 1.day do
  rake task
end

task delete_items: :environment do
  Item.where("created_at <= =7", Time.now - 7.days).destroy_all
end