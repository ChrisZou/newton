json.array!(@time_records) do |time_record|
  json.extract! time_record, :id, :day, :hour, :quarter, :event, :note
  json.url time_record_url(time_record, format: :json)
end
