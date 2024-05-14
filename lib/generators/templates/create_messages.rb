class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :sender, polymorphic: true, null: false
      t.references :receiver, polymorphic: true, null: false
      t.string :subject
      t.text :content, null: false
      t.boolean :viewed, null: false, default: false

      t.timestamps
    end

    add_index :messages, %i[sender_id sender_type]
    add_index :messages, %i[receiver_id receiver_type]
  end
end
