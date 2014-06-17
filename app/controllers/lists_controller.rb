
class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
     @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @item = Item.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list, notice: 'Your new List was saved'
    #display the list you just created
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated"
      redirect_to @list, notice: 'your list was updated'
    # else
    #   flash [:error] = "there was an error saving the list, please try again"
    #   render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List was deleted successfully"
      redirect_to @list
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end

end