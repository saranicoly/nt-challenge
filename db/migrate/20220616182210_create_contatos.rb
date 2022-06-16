class CreateContatos < ActiveRecord::Migration[6.1]
  def change
    create_table :contatos do |t|
      t.string :email
      t.string :phone_number
      t.date :birthday
      t.float :weight

      t.timestamps
    end
  end
end
