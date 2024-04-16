class PostsController < ApplicationController
  # Get rid of the crsf error
  skip_before_action :verify_authenticity_token, only: [:create]


  def index

  end



def create
  if request.request_parameters.blank?
    render json: { success: false, message: "Body can not be blank" }, status: :unprocessable_entity
  else
    post = Post.new(post_params)
    if post.title.blank? || post.content.blank?
      render json: { success: false, message: "Fill in the required fields" }, status: :unprocessable_entity
    elsif post.save
      render json: { success: true, message: "Your post has been created", data: post }, status: :created
    else
      render json: { success: false, message: "An error has occurred" }, status: :unprocessable_entity
    end
  end
end




  private

def post_params
  params.require(:post).permit(:title,  :content,)
end
end
