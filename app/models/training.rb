class Training < ApplicationRecord

  has_many :users

  #Validations
  validate :start_date_cannot_be_in_the_past
  validate :duration_is_multiple_of_5
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

  #Methods

  def duration_is_multiple_of_5
    if duration % 5 != 0 
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end

  def end_date
    self.start_date + (duration * 60)
  end

end
