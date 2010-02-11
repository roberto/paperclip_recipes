class User < ActiveRecord::Base
  
  has_attached_file :local_avatar, :styles => { :medium => "120x120>", :thumb => "80x80>" },
     :default_url => "/system/default/:class_:attachment_:style.jpeg"  #images by sean-b http://www.flickr.com/photos/sean-b/245744537/
  has_attached_file :remote_avatar, :storage => :s3,
    :styles => { :medium => "120x120>", :thumb => "80x80>" },
    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
    :bucket => "papertest",
    :path => ":class/:id/:basename_:style.:extension"
    
  after_save :queue_upload_to_s3
  
  def queue_upload_to_s3
    send_later(:upload_to_s3) if self.local_avatar_updated_at_changed? #alternative: http://tinyurl.com/ydgmloo
  end
  
  def upload_to_s3
    self.remote_avatar = local_avatar.to_file
    self.save(false)
  end
    
  alias_method :avatar=, :local_avatar=
  def avatar
    self.remote_avatar? ? self.remote_avatar : self.local_avatar
  end
  
end
