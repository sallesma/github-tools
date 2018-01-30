require 'dotenv/load'
require 'byebug'
require 'business_time'
require_relative './lib/github'
require_relative './lib/zenhub'
require_relative './lib/models/pull_request'
require_relative './lib/csv_output'

github = Github::Client.new
zenhub = Zenhub.new(
  access_token: ENV['ZENHUB_AUTH_TOKEN'],
  repository_id: ENV['REPOSITORY_ID']
)

BusinessTime::Config.beginning_of_workday = "9:30"
BusinessTime::Config.end_of_workday = "18:30"

pull_requests = github.pull_requests.map{ |result| PullRequest.new(github_params: result.to_h) }
# puts zenhub.board_data

CsvOutput.new(PullRequest, pull_requests).write_to_file
puts "done."
