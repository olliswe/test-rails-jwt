class AddNoteTypeToNote < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :note_type, :string, default: 'message'
  end
end
