every 1.day do
  runner 'Item.where("created_at <= ?", 7.days.ago).destroy_all'
end
