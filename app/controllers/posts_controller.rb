class PostsController < ApplicationController
  def index
    @posts = Post.all
      authorize @posts

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

   def create
     @post = current_user.posts.build(post_params)
      authorize @post
      
     if @post.save
       flash[:notice] = "Your selection was saved!"
       redirect_to @post
     else
       flash[:error] = "There was an error saving the selection. Please try again."
       render :new
     end
   end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Selection was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving your choice, please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    selection = @post.selection

    if @post.destroy
      flash[:notice] = "\"#{selection}\" was deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "There was an error deleting your selection. Please try again."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:selection)
  end


end
