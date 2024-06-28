class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create]

  # def new
  #   @comment = Comment
  # end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_back fallback_location: root_path, notice: 'Comment created successfully.'
    else
      redirect_back fallback_location: root_path, alert: 'Comment could not be created.'
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_back fallback_location: root_path, notice: "Comment deleted successfully"
    else
      redirect_back fallback_location: root_path, notice: "Comment deleted successfully"
    end

  end

  private

  def find_commentable
    case params[:comment][:commentable_type]
    when "Post"
      @commentable = Post.find(params[:comment][:commentable_id])
    when "Comment"
      @commentable = Comment.find(params[:comment][:commentable_id])
    end
  end
  
  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end