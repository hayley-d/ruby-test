# frozen_string_literal: true

class CreatePetsService
  def self.call(user_id:)
    user = User.find_by(id: user_id)
    raise ActiveRecord::RecordNotFound if user.blank?

    Pet.create!(user_id:)
  end
end
