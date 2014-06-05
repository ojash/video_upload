json.array!(@moment_items) do |moment_item|
  json.extract! moment_item, :id, :title, :video, :audio
  json.url moment_item_url(moment_item, format: :json)
end
