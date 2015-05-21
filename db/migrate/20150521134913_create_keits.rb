class CreateKeits < ActiveRecord::Migration
  def change
    create_table :keits do |t|

      t.integer :user_id, null: false
      t.string  :text,    null: false

      t.timestamps null:false

    end
  end
end
