class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :age, :mobile, :pet_names

  def full_name
    "#{object.name} #{object.last_name}"
  end

  def pet_names
    object.pets.pluck(:name)
  end
end
