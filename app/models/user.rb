class User < ActiveRecord::Base
	acts_as_authentic
	has_many :items
	attr_accessor :url_full_name
	def full_name
		[first_name, last_name].join(" ")	
	end
	has_attached_file :photo, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "640x480>", :thumb => "50x50#"},
                  :url  => "/assets/bio/:id/:style/:basename.:extension",
		  :default_url => "/assets/missing/:style/missing2.jpg"
	named_scope :artists, :conditions => {:user_level =>  3, :user_id => 1}  
	#next line is for browse/artist/firstname_lastname  
        def self.get_user_from_url(url_full_name)
		first_last_array = url_full_name.split("_")
		first_name = first_last_array[0] 
		last_name = first_last_array[1] 
		User.find(:first, :conditions => {:first_name => first_name, :last_name => last_name})
	end           
end
