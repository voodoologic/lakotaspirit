class User < ActiveRecord::Base
	acts_as_authentic
	has_many :items
	def full_name
		[first_name, last_name].join(" ")	
	end
	has_attached_file :photo, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "640x480>", :thumb => "50x50#"},
                  :url  => "/assets/bio/:id/:style/:basename.:extension",
		  :default_url => "/assets/missing/:style/missing2.jpg"
	named_scope :artists, :conditions => {:user_level =>  3, :user_id => 1}  
                  
end
