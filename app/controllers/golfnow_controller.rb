class GolfnowController < ApplicationController
  
  def get
    render json: {some_key: "Hello world!"}
  end
  
  def post
    render json: GolfNow.tee_times_by_course_and_time_and_location(params['result'])
  end
  
  def get_courses
    render json: GolfNow.get_courses(params)
  end
  
end