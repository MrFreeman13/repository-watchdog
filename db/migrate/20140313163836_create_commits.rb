class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha, :url, :comments_url
      t.integer :author_id, :commiter_id
      t.text :message

      t.timestamps
    end
  end
end
