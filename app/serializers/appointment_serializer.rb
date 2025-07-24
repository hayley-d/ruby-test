class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :client, :doctor, :date

  def client
    "#{object.user.name} #{object.user.last_name}"
  end

  def doctor
    object.doctor.name
  end
end
