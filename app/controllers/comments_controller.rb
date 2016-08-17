class CommentsController < ApplicationController
  before_action :authenticate_costumer!
  before_action :set_place
  before_action :set_comment, only: [:destroy]
  before_action :authorize_costumer!, only: [:destroy]


  def create
    @comment = @place.comments.create(comment_params)
    @comment.costumer = current_costumer
    if @comment.save
      flash[:success] = 'Comment saved successfuly'
    end
    redirect_to place_path(@place)
  end

  def destroy
    @comment.destroy
    redirect_to @place, notice: 'Comment was deleted.'
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
    
    def set_place
      @place = Place.find(params[:place_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def authorize_costumer!
      redirect_to @place, notice: 'Not authorized.' unless @comment.costumer_id == current_costumer.id
    end
end
