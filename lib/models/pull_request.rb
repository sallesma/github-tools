require 'active_support/all'
require 'business_time'

class PullRequest
  FIELDS = [:number, :url, :title, :created_at, :merged_at, :closed_at, :ended_at, :duration]
  attr_reader(*FIELDS)

  def initialize(github_params: {})
    @number = github_params['number']
    @url = github_params['url']
    @title = github_params['title']
    @created_at = github_params['createdAt']&.to_time
    @merged_at = github_params['mergedAt']&.to_time
    @closed_at = github_params['closedAt']&.to_time
  end

  def self.csv_header
    FIELDS
  end

  def to_csv
    FIELDS.map { |field| self.send(field) }
  end

  def duration
    return unless ended_at.present?

    created_at.business_time_until(ended_at)
  end

  def ended_at
    [merged_at, closed_at].compact.min
  end
end
