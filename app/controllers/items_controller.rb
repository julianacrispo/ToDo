class ItemsController < ApplicationController
    def create
      @list = List.find(params[:list_id])
      @item = @list.item

      @item = Items.build( item_params )
      @item.list = @list
      @new_item = Item.new

      if @item.save
        flash[:notice] = "Item was saved"
      else
        flash[:error] = "There was an error saving. Please try again"
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :description
    )
  end
end


  # def destroy
  #   @topic = Topic.find(params[:topic_id])
  #   @post = @topic.posts.find(params[:post_id])

  #   @comment = @post.comments.find(params[:id])

  #   authorize @comment
  #   if @comment.destroy
  #     flash[:notice] = "Comment was removed."
  #    else
  #     flash[:error] = "Comment couldn't be deleted. Try again."
  #   end
    
  #   respond_with(@comment) do |f|
  #     f.html { redirect_to [@topic, @post] }
  #   end
  # end


# private

#   def list_params
#     params.require(:comment).permit(
#       :body,
#       :post_id
#     )
#   end
# end