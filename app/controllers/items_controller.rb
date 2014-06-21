class ItemsController < ApplicationController
  def create
    @list = current_user.lists.find(params[:list_id])

    @item = @list.items.build( item_params )
    @item.list = @list

    if @item.save
      flash[:notice] = "Item was saved"
    else
      flash[:error] = "There was an error saving. Please try again"
    end

    redirect_to @list
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