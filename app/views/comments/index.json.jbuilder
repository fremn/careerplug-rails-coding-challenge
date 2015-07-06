json.comments(@comments) do |comment|
  json.extract! comment, :id, :message, :job_id
end
