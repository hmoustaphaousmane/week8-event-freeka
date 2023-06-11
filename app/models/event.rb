class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User", optional: true

  # Validations
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true
  validate :duration_must_be_multiple_of_five_and_positive
  validates :title, presence: true, length: { in: 5..14 }
  validates :bio, presence: true, length: { in: 20..1000 }
  validates_numericality_of :price, :only_integer => true, :allow_nil => false, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 1000,
    :message => "can only be whole number between 1 and 1000."
  validates :location, presence: { message: "must be spacified." }

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past.")
    end
  end

  def duration_must_be_multiple_of_five_and_positive
    if duration <= 0 || duration % 5 != 0
      errors.add(:duration, "must be positive and a multiple of five (5).")
    end
  end
end
