class PetSerializer < ActiveModel::Serializer
  attributes :name, :username

  def username
    "#{object.user.name} #{object.user.last_name}" if object.user
  end
end
