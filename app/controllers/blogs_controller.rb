class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show update destroy]

  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def show
    render json: @blog
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :description, :published, :user_id)
  end
end
