class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def new
     @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list, notice: 'Your new List was saved'
  end

  def show
    @list = List.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def list_params
    params.require(:list).permit(:description)
  end

end