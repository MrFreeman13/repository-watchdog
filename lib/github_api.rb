require 'net/http'

class GithubApi

  attr_accessor :owner, :repository

  def initialize(owner, repository)
    @owner = owner
    @repository = repository
  end

  def commits
    request_url = "https://api.github.com/repos/#{@owner}/#{@repository}/commits"
    response = Net::HTTP.get(URI.parse(request_url))
    result = JSON.parse(response)
  end
end