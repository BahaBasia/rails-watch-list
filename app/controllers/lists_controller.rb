class ListsController < ApplicationController

  before_action :get_list, only: [:show]

  # search for the lists with the quest params

  def index
    if params[:query].present?
      @query = params[:query]
      @lists = List.where("name ILIKE ?","%#{params[:query]}%")
    else
      @lists = List.all
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
   @list = List.new(list_params)
      if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
