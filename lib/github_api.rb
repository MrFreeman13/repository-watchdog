require 'net/http'

class GithubApi

  attr_accessor :owner, :repository

  def initialize(owner, repository)
    @owner = owner
    @repository = repository
  end

  def commits(parameters_str = "")
    request_url = "https://api.github.com/repos/#{@owner}/#{@repository}/commits#{parameters_str}"
    response = Net::HTTP.get(URI.parse(request_url))
    JSON.parse(response)
  end
end