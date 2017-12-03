module Github
  module Queries
    module Issues
      IssueFragment = Github::Api::Client.parse <<-'GRAPHQL'
        fragment on Issue {
          title
          url
          labels(first: 10) {
            edges {
              node {
                name
              }
            }
          }
        }
      GRAPHQL

      Query = Github::Api::Client.parse <<-'GRAPHQL'
      query {
        repository(owner:"octocat", name:"Hello-World") {
          issues(last:5, states:CLOSED) {
            edges {
              node {
                ...Github::Queries::Issues::IssueFragment
              }
            }
          }
        }
      }
    GRAPHQL
    end
  end
end
