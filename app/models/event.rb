class Event < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :event_date, presence: true
  # validates_uniqueness_of :

  # TODO: fix date validation and rspec

  # TODO: look into how uniqueness works. Uniqueness should only apply to both name and date. You should be able to have multiple events on one date and muliple events with the same name on different dates. Look up scope validation

  has_many :photos
  belongs_to :user
end
