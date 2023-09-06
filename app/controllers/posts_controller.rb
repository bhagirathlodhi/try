class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit ]
  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find_by(id: current_user.id)
    @post = @user.posts.new(post_params)

    if @post.save
      UserMailer.welcome_email(@post).deliver_now
      redirect_to root_path, notice: 'post has been created successfully'
    else
      render :new, notice: 'Somthing went wrong'
    end
  end

  def show
  end

  def edit
  end

  def def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :root_path, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post deleted"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
