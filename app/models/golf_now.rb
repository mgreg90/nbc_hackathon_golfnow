class GolfNow < ApplicationRecord
    def self.tee_times_by_course_and_time_and_location(params)
        {
            speech: '',
            displayText: '',
            text: 'yep',
            data: {
                slack: {
                    "text": speech,
                    "attachments": [
        {
            "title": channel.get('title'),
            "title_link": channel.get('link'),
            "color": "#36a64f",

            "fields": [
                {
                    "title": "Condition",
                    "value": "Temp " + condition.get('temp') +
                             " " + units.get('temperature'),
                    "short": "false"
                },
                {
                    "title": "Wind",
                    "value": "Speed: " + channel.get('wind').get('speed') +
                             ", direction: " + channel.get('wind').get('direction'),
                    "short": "true"
                },
                {
                    "title": "Atmosphere",
                    "value": "Humidity " + channel.get('atmosphere').get('humidity') +
                             " pressure " + channel.get('atmosphere').get('pressure'),
                    "short": "true"
                }
            ],

            "thumb_url": "http://l.yimg.com/a/i/us/we/52/" + condition.get('code') + ".gif"
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
