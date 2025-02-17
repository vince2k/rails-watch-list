class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
