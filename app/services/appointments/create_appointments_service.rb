# frozen_string_literal: true

class CreateAppointmentsService
  def self.call(user_id:, doctor_id:)
    user = User.find_by(id: user_id)
    raise ActiveRecord::RecordNotFound if user.blank?

    doctor = Doctor.find_by(id: doctor_id)
    raise ActiveRecord::RecordNotFound if doctor.blank?

    date = Date.today

    Appointment.create!(user_id: user.id, doctor_id: doctor.id, date: date)
  end
end
