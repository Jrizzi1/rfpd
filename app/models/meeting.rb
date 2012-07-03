class Meeting < ActiveRecord::Base
validates_presence_of :meets_on
validates_length_of :location, :minimum=>4

searchable do
  text :location, :name
  text :description
end

#methods
def self.upcoming_meetings
	find(:all, :conditions => "meets_on > CURRENT_TIMESTAMP()",
				:order		=> "meets_on")
end	
def self.past_meetings
	find(:all, :conditions => "meets_on <= CURRENT_TIMESTAMP()",
				:order		=> "meets_on")
end
# formatted name based on date
def name
	meets_on.to_s(:long)
end	
end
