class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new()
    @category = Category.all
  end

  def create
    #Initialize  model with attributes
    @post = Post.new(post_params)

    # Save in database
    if @post.save
      #Create flash message
      flash[:notice] = "Post successfully created"

      #Redirect to main resource pages
      redirect_to posts_path
    else
      #Show form again
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, :notice => "Your post has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  end

  private
    def post_params
      params.require(:post).permit(:title, :category_id, :body)
    end

end
