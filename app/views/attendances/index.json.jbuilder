json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :user_id, :work_date, :in_time, :out_time, :project_name, :place, :description
  json.url attendance_url(attendance, format: :json)
end
