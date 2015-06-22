json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :user_id
  json.url timetable_url(timetable, format: :json)
end
