class Item < ActiveRecord::Base
	attr_reader :per_page
  	@@per_page = 10
  #
  #Item status { 1 => "Waiting for approval", 2 => "For Sale", 3 => "On Sale", 4 => "Processed", 5 => "Closed" }
  #
  after_create :set_item_status
  named_scope :for_sale, :conditions => {:status => 2..3 }
  require 'paperclip'
  validates_presence_of :price
  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :category
  validates_presence_of :short_description
  validates_attachment_presence :photo
  has_attached_file :photo, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "640x480>", :thumb => "50x50#"},
                    :url  => "/assets/products/:id/:style/:basename.:extension",
        :default_url => "assets/missing/:style/missing2.jpg"
  #this should change to normal 
  def self.search(search, page)
    paginate :per_page => 6, :page => page,
    :conditions =>{ :status => 2..3}, 
    :order => 'id'
  end
  def approve
    self.status = '2'
  end
  def self.paginate_category(page)
    paginate :per_page => 6,
          :page=> page,
          :order => 'id'
  end
  belongs_to :user
  has_many :cart_items
  has_many :carts, :through => :cart_items
  def set_item_status
    unless self.user.user_level >= 4
      self.status = 1
    end
  end
end
