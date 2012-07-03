require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  fixtures :meetings
  # test "the truth" do
  #   assert true
  # end
  def test_should_find_upcoming_meetings
    meetings = Meeting.upcoming_meetings
    assert meetings.size > 0
    for meeting in meetings
      assert meeting.meets_on > Time.now.to_date
    end
  end
  
  def test_should_find_past_meetings
    meetings = Meeting.past_meetings
    assert meetings.size > 0
    for meeting in meetings
      assert meeting.meets_on <= Time.now.to_date
    end
  end
  
  def test_should_create_meeting
    assert_difference 'Meeting.count', 1 do
      meeting = create_meeting
      assert !meeting.new_record?
    end
  end
  
  def test_should_require_meets_on
    m = create_meeting(:meets_on => nil)
    assert m.errors.invalid?(:meets_on)
  end
  
  def test_should_have_a_location_with_4_char_min
    m = create_meeting(:location => 'six')
    assert m.errors.invalid?(:location)
  end  
  
  def test_should_format_date_as_name
    meeting = meetings(:today_meeting)
    assert_match /\w* \d{1,2}, \d{4}/i, meeting.name
  end
  
  protected
    def create_meeting(options={})
    attrs = {:meets_on => "2008-01-01",
      :location => "university Library",
      :description => "lightning Talks" }.merge(options)
      Meeting.create(attrs)
    end
end
