class Event < ApplicationRecord
  belongs_to :user

  validates :start_date, :presence => { :message => "must be a valid date/time" }

  validates :title, :presence => { :message => "must have a title"}
  validates :title,
  length: { in: 6..20 }

  validates :description,
  length: { in: 20..2000},
  presence: true

  validates :price, :numericality => {greater_than: 0, less_than:2001}, presence: true
  
  validates :location, presence: true 

  private
  validate :start_date_after_now
  def start_date_after_now
    if duration
      errors.add(:start_date, "must be after now") unless
      start_date > Time.now
    end
  end

  validate :duration_positive
  def duration_positive
    if duration
      errors.add(:duration, "duration must be positive") unless
      duration > 0
    end
  end

  validate :duration_multiple_of_5
  def duration_multiple_of_5
    errors.add(:duration, "must be a multiple of 5") unless
    duration % 5 == 0
  end
  
end
