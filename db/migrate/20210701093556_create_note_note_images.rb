class CreateNoteNoteImages < ActiveRecord::Migration[6.1]
  def change
    create_table :note_note_images do |t|

      t.timestamps
    end
  end
end
