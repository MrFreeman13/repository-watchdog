# == Schema Information
#
# Table name: commits
#
#  id           :integer          not null, primary key
#  sha          :string(255)
#  url          :string(255)
#  comments_url :string(255)
#  author_id    :integer
#  commiter_id  :integer
#  message      :text
#  created_at   :datetime
#  updated_at   :datetime
#  commit_date  :datetime
#

class Commit < ActiveRecord::Base
  validates_presence_of :sha, :url, :commiter_id, :author_id, :message

  belongs_to :author, :class_name => "User"
  belongs_to :commiter, :class_name => "User"


  def self.build_commits(commits_json)
    commits_json.each do |single_commit|
      new_commit = Commit.new(sha: single_commit["sha"], url: single_commit["html_url"], comments_url: single_commit["comments_url"], message: single_commit["commit"]["message"], commit_date: single_commit["commit"]["author"]["date"])

      author = User.build_author(single_commit)
      commiter = User.build_committer(single_commit)

      new_commit.author = author
      new_commit.commiter = commiter
      new_commit.save
    end
  end
end
