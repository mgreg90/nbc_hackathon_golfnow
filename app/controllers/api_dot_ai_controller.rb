require_relative '../modules/golfnow_controller_methods'
require_relative '../modules/competition_controller_methods'

class ApiDotAiController < ApplicationController
  include GolfnowControllerMethods
  include CompetitionControllerMethods
  
  BASE_URL = "https://golfnow-hackathon.herokuapp.com"
  VALID_ACTIONS = [
    {
      action: 'get_competitions',
      render: "render json: Competition.create_four.map{ |c| c.slackify }.to_json"
    }, {
      action: 'get_courses',
      render: "render json: GolfNow.get_courses(params)"
    }
  ]
  
  def action_handler
    p action
    puts "*" * 50
    puts "PARAMS:"
    p params
    # VALID_ACTIONS.each do |x|
    #   if x[:action] == action
    #     eval x[:render]
    #   end
      render json: Competition.create_four.map{ |c| c.slackify }.to_json
    # end
    # if VALID_ACTIONS.include? action
    #   send(VALID_ACTIONS[VALID_ACTIONS.index { |x| }])
    # end
  end
  
  def action
    params['result']['action']
  end
      
end
