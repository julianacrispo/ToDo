module ApplicationHelper

 def item_url_helper(item)
    list = item.list
    [list, item]
  end

end
