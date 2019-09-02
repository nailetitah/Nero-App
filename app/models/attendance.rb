class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :training

  # after_create :attendance_send

end
