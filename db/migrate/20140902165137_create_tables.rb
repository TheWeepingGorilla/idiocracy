class CreateTables < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.belongs_to :user
    end
    create_table :responses do |t|
      t.text :response
      t.belongs_to :user
    end
    create_table :users do |t|
      t.string :name
      t.string :password_digest
    end
    create_table :votes do |t|
      t.integer :user_id
      t.integer :response_id
    end
  end
end
