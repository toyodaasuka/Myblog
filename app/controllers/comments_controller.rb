class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.comments.create(comment_params)
        redirect_to post_path(@post)
        flash[:notice] = "Posted a comment!"
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
        flash[:notice] = "Comment deleted!"
    end
    
    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
