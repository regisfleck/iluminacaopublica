class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :login
      t.string :email
      t.integer :matricula
      t.string :password_digest

      t.timestamps
    end
  end
end
