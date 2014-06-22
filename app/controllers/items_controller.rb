class ItemsController < ApplicationController

  def show
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items
    @item = Item.new
  end

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

  def destroy
    #grab item from the list
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
    #delete that item
    if @item.destroy
      flash[:notice] = "item was removed"
    else
      flash[:error] = "item couldn't be removed. try again"
    end
    # respond_with(@item) do |f|
      redirect_to @list
    end


  private

  def item_params
    params.require(:item).permit(
      :description
    )
  end
end


 