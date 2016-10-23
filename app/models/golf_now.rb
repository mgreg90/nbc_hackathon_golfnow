class GolfNow < ApplicationRecord
  require 'base64'
  
  GOLF_NOW_URL = 'https://affiliate.gnsvc.com/api/'
  GET_COURSE_SUM_REQUEST = "v1/channels/#{ENV['CHANNEL_ID']}/course-summaries"
  GET_COURSE_REQUEST = "v1/channels/#{ENV['CHANNEL_ID']}/courses/"
  PROX = 200
  
  
  
  def self.tee_times_by_course_and_time_and_location(params)
    {
      speech: '',
      displayText: '',
      text: 'yep',
      data: {
        slack: {
          "text": 'hello world!',
          "attachments": [
            {
              "thumb_url": "http://www.cats.org.uk/uploads/images/pages/photo_latest14.jpg",
              "title": 'Title',
              "title_link": 'title_lin',
              "color": "#36a64f",
              "fields": [
                {
                  "title": "Condition",
                  "value": "value",
                  "short": "false"
                }
              ]
            }
          ]
        },
      },
      contextOut: [],
      source: ''
    }.to_json
  end
  
  def self.get_courses(params)
    query = { latitude: params[:latitude], longitude: params[:longitude], proximity: PROX }
    HTTParty.get("#{GOLF_NOW_URL}#{GET_COURSE_SUM_REQUEST}", query: query, headers: headers)
  end
  
  def self.get_course_by_id(id)
    HTTParty.get("#{GOLF_NOW_URL}#{GET_COURSE_REQUEST}#{id}", headers: headers).parsed_response
  end
  
  def self.headers
    auth = "#{ENV['GOLF_NOW_CLIENT_ID']}:#{ENV['GOLF_NOW_CLIENT_SECRET']}"
    {
      "Authorization" => "Basic #{Base64.encode64(auth).gsub(/\n+/, '')}",
      "Content-Type" => 'application/json'
    }
  end
    
end
