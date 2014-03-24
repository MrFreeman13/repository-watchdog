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
end
