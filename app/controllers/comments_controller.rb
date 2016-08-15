class CommentsController < ApplicationController
  before_action :set_place, only: [:create, :destroy]
  def create
    @comment = @place.comments.create(comment_params)
    if @comment.save
      flash[:success] = 'Comment saved successfuly'
    end
    redirect_to place_path(@place)
  end

  def destroy
    @comment = @place.comments.find(params[:id])
    @comment.destroy
    redirect_to place_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
    def set_place
      @place = Place.find(params[:place_id])
    end
end
