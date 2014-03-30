class CommitsController < ApplicationController
  before_action :initialize_github_instance

  def index
    @commits = Commit.all
  end

  def update
    if Commit.any?
      repository_commits = @github_api_obj.commits("?per_page=100")
    else
      last_commit_date = Commit.last.commit_date
      repository_commits = @github_api_obj.commits("?since=#{last_commit_date}")
    end

    @new_commits = repository_commits.empty? ? [] : Commit.build_commits(repository_commits)
  end


  private

  def initialize_github_instance
    @github_api_obj = GithubApi.new("rails", "rails")
  end

end
