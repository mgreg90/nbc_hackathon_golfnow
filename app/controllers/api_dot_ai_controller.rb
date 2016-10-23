class ApiDotAiController < ApplicationController
  
  VALID_CONTROLLERS_ACTIONS = [
    {
      controller: 'competition',
      action: 'get_competitions',
      route: '/get_competitions'
    }#, {
      # controller: 'golfnow',
      # action: 'tee_times_by_course_and_time_and_location',
      # route: '/'
    # }
  ]
  
  def action_handler
    redirect_to action_url if valid_actions.include? action
  end
  
  def action
    params['result']['action']
  end
  
  def action_url
    VALID_CONTROLLERS_ACTIONS.each do |x|
      return "#{x[:route]}" if x[:action] == action
    end
  end
  
  def valid_actions
    VALID_CONTROLLERS_ACTIONS.map { |x| x[:action] }
  end
  
end
