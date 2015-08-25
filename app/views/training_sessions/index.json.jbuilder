json.array!(@training_sessions) do |training_session|
  json.extract! training_session, :id, :date, :committee, :topic, :description, :image_url, :topic_guide_url, :start_time, :end_time, :subheading, :page_description, :is_active
  json.url training_session_url(training_session, format: :json)
end
