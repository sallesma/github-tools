require 'dotenv/load'
require 'byebug'
require_relative './lib/github'
require_relative './lib/zenhub'

github = Github::Client.new
zenhub = Zenhub.new(
  access_token: ENV['ZENHUB_AUTH_TOKEN'],
  repository_id: ENV['REPOSITORY_ID']
)

puts github.pull_requests.map(&:to_h)
# puts zenhub.board_data
