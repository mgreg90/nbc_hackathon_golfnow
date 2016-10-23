module CompetitionControllerMethods
  
  def get_competitions
    render json: Competition.create_four.map{ |c| c.slackify }.to_json
  end
  
end
