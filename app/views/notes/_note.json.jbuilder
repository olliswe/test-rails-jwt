show_user ||= false
if show_user
  json.author do
    json.extract!(note.user, :username, :id)
  end
end
json.extract!(note, :message, :id)
