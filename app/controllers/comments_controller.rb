class CommentsController < ApplicationController
  include CommentsHelper
  def index
    post = Post.find(params[:post_id])
    comments = post.comments.hash_tree

    render json: comments_tree_for(comments)
  end

  def create
    post = Post.find(params[:post_id])
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment][:parent_id])
      comment = parent.children.build(comment_params)
    else
      comment = post.comment.new(comment_params)
    end

    if comment.save
      render json: comment
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: {status: "Deleted"}
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body, :author, :post_id, :parent_id)
  end
end
