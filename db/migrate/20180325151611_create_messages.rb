class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :question
      t.string :answer
      t.string :reply_type
      t.string :conversation_id

      t.timestamps
    end
  end
end
