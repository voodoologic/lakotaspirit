class Item < ActiveRecord::Base
require 'paperclip'
validates_presence_of :price
validates_presence_of :title
validates_presence_of :user_id
validates_presence_of :category
validates_presence_of :short_description
validates_attachment_presence :photo
has_attached_file :photo, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "640x480>", :thumb => "50x50#"},
                  :url  => "/assets/products/:id/:style/:basename.:extension"
def self.search(search, page)
  paginate :per_page => 6, :page => page,
           :conditions => ['title like ?', "%#{search}%"],
           :order => 'id'
end
def self.paginate_category(page)
	paginate :per_page => 6,
				:page=> page,
				:order => 'id'
end
belongs_to :user
has_many :cart_items
has_many :carts, :through => :cart_items
end