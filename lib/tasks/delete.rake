desc "deletes items that have been on the todo list over 7 days"

task delete_items: :environment do
  Item.where("created_at <= ?", Time.now - 7.days).destroy_all
end