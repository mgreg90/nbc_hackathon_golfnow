class GolfNow < ApplicationRecord
  
  GOLF_NOW_URL = 'https://affiliate.gnsvc.com/api'
  
  
  
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
  
  def self.get_course(params)
    HTTParty.get "#{GOLF_NOW_URL}"
  end
  
end
