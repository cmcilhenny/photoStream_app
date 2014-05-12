class Photo < ActiveRecord::Base
  # attr_accessor :created_at

  belongs_to :event

  has_attached_file :image, styles: {
    # thumb: '100x100>',
    # square: '200x200#',
    medium: '300x300>',
    # full: '500x500^'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :event_id, presence: true

end

