class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: "desc")
    end
    
    def show
        @post = Post.find(params[:id])
        # show.html.erbで@post.comments.buildとしない場合は下記を使う
        # @comment = Comment.new(post_id: @post.id)
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "I posted a new!"
            redirect_to posts_path
        else
           # render plain: @post.errprs.inspect
           render "new"
        end
    end
    
    def edit
        @post = Post.find_by(id: params[:id])
        #@post = Post.find(params[:id]) 
    end
    
    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        flash[:notice] = "Deleted post!"
        redirect_to posts_path
    end
    
    def update
         @post = Post.find_by(id: params[:id])  
         #@post = Post.find(params[:id]) 
         if @post.update(post_params)
             flash[:notice] = "Updated post!"
             redirect_to posts_path
         else
             render "edit"
         end
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
    
end

