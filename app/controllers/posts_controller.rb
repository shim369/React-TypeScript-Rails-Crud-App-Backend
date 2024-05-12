class PostsController < ApplicationController
	def index
	  render json: Post.all, methods: [:image_url]
	end

	def show
	  post = Post.find(params[:id])
	  render json: post, methods: [:image_url]
	end

	def create
	  post = Post.new(post_params)
	  if post.save
		render json: post, methods: [:image_url], status: :created
	  else
		render json: post.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  post = Post.find(params[:id])
	  post.destroy!
	  render json: post
	end

	private

	def post_params
		params.permit(:title, :content, :image)
	end
end
