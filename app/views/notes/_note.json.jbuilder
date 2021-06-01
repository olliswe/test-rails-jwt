if policy(note).can_see_author?
  json.author do
    json.extract!(note.user, :username, :id)
  end
end
json.extract!(note, :message, :id)
