class User < ActiveRecord::Base
  #attr_accessor :avatar, :avatar_file_name
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
  if Rails.env.production?
  has_attached_file :avatar, styles: { large: "670x520", medium: "300x220>", thumb: "150x150#" },
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :path => ":style/:id_:filename"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  else
    has_attached_file :avatar,
      :styles => {:medium => "200x", :thumb => "100x100>" }
  end
    has_secure_password

  validates :email, uniqueness: true 
  has_many :tips
  extend FriendlyId
  friendly_id :first_name, use: :slugged


  def self.confirm(email_param, password_param)
    user = User.find_by_email(email_param)
    user.authenticate(password_param)
  end
end
