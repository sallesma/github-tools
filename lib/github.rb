require "graphql/client"
require "graphql/client/http"
require_relative 'github/api'
require_relative 'github/queries/issues'

module Github
  class Client
    def last_5_issues
      response = client.query(Github::Queries::Issues::Query)
      response.data.repository.issues.edges.map(&:node)
    end

    private

    def client
      @client ||= Github::Api::Client
    end
  end
end
