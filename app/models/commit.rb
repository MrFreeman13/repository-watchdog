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
#

class Commit < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :commiter, :class_name => "User"
end
