class PostsController < ApplicationController
  before_action  :find_post, only: [:show, :edit , :update, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

    def show
      @post = Post.find(params[:id])
    end
    
    def edit
    end
    
    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    end

    def destroy
      @post.destroy
      redirect_to  root_path
    end



  private
   def find_post
    @post = Post.find(params[:id])
   end

   def post_params
    params.require(:post).permit(:title, :body)
   end
  

  end
end
