class GolfnowController < ApplicationController
  
  def get
    render json: {some_key: "Hello world!"}
  end
  
  def post
    #   p params
    #   render json: {post: 'some text'}
      puts params
      tee_times_by_course_and_time_and_location(params)
      render json: params
  end
  
  private
  
  def params
      params['result']
  end
  
end
