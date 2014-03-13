class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :login, :avatar_url

      t.timestamps
    end
  end
end
