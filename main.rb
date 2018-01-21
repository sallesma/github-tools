require 'dotenv/load'
require 'byebug'
require_relative './lib/github'
require_relative './lib/zenhub'
require_relative './lib/models/pull_request'

github = Github::Client.new
zenhub = Zenhub.new(
  access_token: ENV['ZENHUB_AUTH_TOKEN'],
  repository_id: ENV['REPOSITORY_ID']
)

puts github.pull_requests.map{ |result| PullRequest.new(github_params: result.to_h) }
# puts zenhub.board_data
