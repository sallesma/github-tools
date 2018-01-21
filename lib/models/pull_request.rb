class PullRequest
  attr_reader :number, :url, :title, :created_at, :merged_at, :closed_at

  def initialize(github_params: {})
    @number = github_params['number']
    @url = github_params['url']
    @title = github_params['title']
    @created_at = github_params['createdAt']
    @merged_at = github_params['mergedAt']
    @closed_at = github_params['closedAt']
  end
end
