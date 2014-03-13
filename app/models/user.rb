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
end
