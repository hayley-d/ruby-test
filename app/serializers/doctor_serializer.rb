class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :available

  def available
    object.active
  end
end
