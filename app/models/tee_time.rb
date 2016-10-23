class TeeTime < ApplicationRecord
  
  GOLF_NOW_URL = 'https://affiliate.gnsvc.com/api/'

  class << self
    
    def find_tee_times_by_course(course_id)
      HTTParty.get("#{GOLF_NOW_URL}#{get_tee_times_request(course_id)}", headers: headers).parsed_response
    end
    
  end

  def get_tee_times_request(course_id)
    "v1/channels/#{ENV['CHANNEL_ID']}/courses/#{course_id}/tee-time-summaries"
  end

  
  def attachment
    {
      thumb_url: image,
      title: name,
      title_link: 'http://www.google.com', # TODO need a url
      color: '#308b52',
      fields: [
        {
          title: 'Hosted By',
          value: "#{course['name']}\n#{street_address}\n#{city_state_zip}",
          short: true
        }, {
          title: 'Time',
          value: "#{dates}\n#{times}"
        }
      ]
    }    
  end
  
end