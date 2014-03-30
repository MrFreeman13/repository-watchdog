# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  login      :string(255)
#  avatar_url :string(255)
#  created_at :datetime
#  updated_at :datetime
#  github_id  :integer
#

class User < ActiveRecord::Base
  validates_presence_of :name, :email, :login
  validates_uniqueness_of :email

  has_many :commits

  def self.build_author(single_commit)
    author = User.find_or_create_by(name: single_commit["commit"]["author"]["name"], email: single_commit["commit"]["author"]["email"], login: single_commit["author"]["login"], avatar_url: single_commit["author"]["avatar_url"], github_id: single_commit["author"]["id"])
    author
  end

  def self.build_committer(single_commit)
    committer = User.find_or_create_by(name: single_commit["commit"]["committer"]["name"], email: single_commit["commit"]["committer"]["email"], login: single_commit["committer"]["login"], avatar_url: single_commit["committer"]["avatar_url"], github_id: single_commit["committer"]["id"])
    committer
  end
end
