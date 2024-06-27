class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable


  def new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user 

    if @comment.save
      redirect_back fallback_location: root_path, notice: "Comment created successfully"
    else
      redirec_back fallback_location: root_path, alert: "Error creating comment"
    end
  end

  def destroy
  end

  private

  def find_commentable
      @commentable = Post.find(params[:commentable_id]) if params[:commentable_type] == "Post"
      @commentable = Comment.find(params[:commentable_id]) if params[:commentable_type] == "Comment"
  end

  
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
