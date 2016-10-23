Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'golfnow#get'
  
  post '/golfnow' => 'golfnow#post'
  
  post '/get_courses' => 'golfnow#get_courses'
end
