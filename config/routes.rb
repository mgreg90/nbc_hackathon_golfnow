Rails.application.routes.draw do
  get 'api_dot_ai/action_handler'

  get 'competition/get_competitions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'golfnow#get'
  
  post '/api-dot-ai' => 'api_dot_ai#action_handler'
  
  post '/get_courses' => 'golfnow#get_courses'
  
  post '/get_competitions' => 'competition#get_competitions'
  
end
