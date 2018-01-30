require 'active_support/all'
class PullRequest
  FIELDS = [:number, :url, :title, :created_at, :merged_at, :closed_at, :ended_at]
  attr_reader(*FIELDS)

  def initialize(github_params: {})
    @number = github_params['number']
    @url = github_params['url']
    @title = github_params['title']
    @created_at = github_params['createdAt']&.to_time
    @merged_at = github_params['mergedAt']&.to_time
    @closed_at = github_params['closedAt']&.to_time
    @ended_at = [@merged_at, @closed_at].min
  end

  def self.csv_header
    FIELDS
  end

  def to_csv
    FIELDS.map { |field| self.send(field) }
  end
end
