class GolfnowController < ApplicationController
  
  def get
    render json: {some_key: "Hello world!"}
  end
  
  def post
    #   p params
    #   render json: {post: 'some text'}
      render json: params
  end
  
  private
  
  # def params
  #     params
  # end
  
end
