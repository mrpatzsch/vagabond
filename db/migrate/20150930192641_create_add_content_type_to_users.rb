class CreateAddContentTypeToUsers < ActiveRecord::Migration
  def change
    create_table :add_content_type_to_users do |t|

      t.timestamps null: false
    end
  end
end
