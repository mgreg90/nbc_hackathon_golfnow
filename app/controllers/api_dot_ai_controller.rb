require '../modules/golfnow_controller_methods.rb'
require '../modules/competition_controller_methods.rb'

class ApiDotAiController < ApplicationController
  include 'golfnow_controller_methods'
  include 'competition_controller_methods'
  
  BASE_URL = "https://golfnow-hackathon.herokuapp.com"
  VALID_CONTROLLERS_ACTIONS = [
    'get_competitions',
    'get_courses'
  ]
  
  def action_handler
    puts "*" * 50
    puts "PARAMS:"
    p params
    if valid_actions.include? action
      send action
    end
  end
  
  def action
    params['result']['action']
  end
    
  def valid_actions
    VALID_CONTROLLERS_ACTIONS.map { |x| x[:action] }
  end
  
end
