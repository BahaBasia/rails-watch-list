class BookmarksController < ApplicationController

  before_action :get_list, only: [ :new, :create ]
  before_action :get_bookmark, only: :destroy


  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    flash[:notice] = @bookmark.errors.full_messages.to_sentence unless @bookmark.save
    redirect_to list_path(@list)
  end


def destroy
  @bookmark.destroy
  redirect_to list_path(@bookmark.list)
end

private

def
  @list = List.find(params[:list_id])
end

def get_bookmark
  @bookmark = Bookmark.find(params[:id])
end

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end

end
