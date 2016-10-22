class GolfNow < ApplicationRecord
    def self.tee_times_by_course_and_time_and_location(params)
        {
            speech: '',
            displayText: '',
            text: 'yep',
            data: {
                facebook: {
                    "attachment":{
                        "type":"image",
                        "payload":{
                           "url":"http://d39kbiy71leyho.cloudfront.net/wp-content/uploads/2016/05/09170020/cats-politics-TN.jpg"
                        }
                    }
                }
            },
            contextOut: [],
            source: ''
        }.to_json
    end
    
end
