class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    Comment.create!(comment_params)
    @comments = Comment.all
    render action: :index
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :text)
  end
end
