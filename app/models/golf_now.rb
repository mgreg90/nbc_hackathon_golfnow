class GolfNow < ApplicationRecord
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
            "title": 'Title',
            "title_link": 'title_lin',
            "color": "#36a64f",

            "fields": [
                {
                    "title": "Condition",
                    "value": "value",
                    "short": "false"
                }
            ],

            "thumb_url": "http://www.cats.org.uk/uploads/images/pages/photo_latest14.jpg"
        }
    ]
},
            },
            contextOut: [],
            source: ''
        }.to_json
        # data
    end
    
end
