json.extract! appointment, :id, :date, :doctor_id, :user_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
