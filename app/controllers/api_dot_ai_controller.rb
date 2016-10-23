require_relative '../modules/golfnow_controller_methods'
require_relative '../modules/competition_controller_methods'

class ApiDotAiController < ApplicationController
  include GolfnowControllerMethods
  include CompetitionControllerMethods
  
  BASE_URL = "https://golfnow-hackathon.herokuapp.com"
  VALID_ACTIONS = [
    'get_competitions',
    'get_courses'
  ]
  
  def action_handler
    p action
    puts "*" * 50
    puts "PARAMS:"
    p params
    if VALID_ACTIONS.include? action
      send action
    end
  end
  
  def action
    params['result']['action']
  end
      
end
