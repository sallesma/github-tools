class PullRequest
  FIELDS = [:number, :url, :title, :created_at, :merged_at, :closed_at]
  attr_reader(*FIELDS)

  def initialize(github_params: {})
    @number = github_params['number']
    @url = github_params['url']
    @title = github_params['title']
    @created_at = github_params['createdAt']
    @merged_at = github_params['mergedAt']
    @closed_at = github_params['closedAt']
  end

  def self.csv_header
    FIELDS
  end

  def to_csv
    FIELDS.map { |field| self.send(field) }
  end
end
