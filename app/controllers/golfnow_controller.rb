class GolfnowController < ApplicationController
  
  def get
    render json: {some_key: "Hello world!"}
  end
  
end
