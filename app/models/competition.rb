class Competition
  
  attr_reader :name, :course_id, :start_time, :end_time, :reward, :spots_left, :points, :image
  
  DEFAULT_IMAGE_PATH = 'http://golfhabits.com/wp-content/uploads/2016/06/short-putt.jpg'
  
  class << self
    
    def create_three
      start_time = Time.new(2016, 10, 30, 8, 0, 0, "-05:00")
      end_time = Time.new(2016, 10, 30, 16, 0, 0, "-05:00")
      options = { spots_left: 7 }
      [3635, 3664, 5527].map.with_index do |x, i|
        new("Competition ##{i+1}", x, start_time, end_time, options).attachment
      end
    end
      
    def slackify
      # name, course name, address, start_time, end_time, spots_left
      {
        speech: '',
        displayText: '',
        text: 'yep',
        data: {
          slack: slack_sub_hash(create_three)
        },
        contextOut: [],
        source: ''
      }
    end
    
    def slack_sub_hash(attachments=[])
      {
        text: "Check it out! A competition near you.",
        attachments: attachments
      }
    end
    
  end
  
  def initialize(name, course_id, start_time, end_time, options={})
    @name = name
    @course_id = course_id
    @start_time = start_time
    @end_time = end_time
    @reward = options[:reward]
    @spots_left = options[:spots_left] || 0
    @points = options[:points]
    set_image(options[:image])
  end
  
  def set_image(image_path)
    @image = image_path || DEFAULT_IMAGE_PATH
  end
  
  def course
    @course ||= get_course.to_h
  end
  
  def get_course
    GolfNow.get_course_by_id(course_id)
  end
  
  def address
    course['address']
  end
  
  def street_address
    address['line1']
  end
  
  def city_state_zip
    "#{address['city']}, #{address['stateOrProvincialCode']} #{address['postalCode'][0..4]}"
  end
  
  def dates
    "#{start_time.month} #{start_time.day} - #{end_time.day}"
  end
  
  def times
    "#{start_time.hour}:#{start_time.min} #{am_or_pm(start_time.hour)} - "\
    "#{end_time.hour}:#{end_time.min} #{am_or_pm(end_time.hour)}"
  end
  
  def am_or_pm(int)
    if int / 12 == 0
      "AM"
    elsif int / 12 == 1
      "PM"
    else
      raise "Invalid time!"
    end
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
          value: "#{course[:name]}\n#{street_address}\n#{city_state_zip}",
          short: true
        }, {
          title: 'Time',
          value: "#{dates}\n#{times}"
        }
      ]
    }    
  end
  
end