json.array!(@awards) do |award|
  json.extract! award, :id, :award, :subheading, :page_description, :is_active
  json.url award_url(award, format: :json)
end
