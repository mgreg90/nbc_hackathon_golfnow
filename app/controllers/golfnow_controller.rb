class GolfnowController < ApplicationController
  
  def get
    render json: {some_key: "Hello world!"}
  end
  
  def post
      render json: params
  end
  
  private
  
  def params
      params
  end
  
end
