module Github
  module Queries
    module PullRequests
      PullRequestFragment = Github::Api::Client.parse <<-'GRAPHQL'
        fragment on PullRequest {
          number
          url
          title
          createdAt
          mergedAt
          closedAt
        }
      GRAPHQL

      Query = Github::Api::Client.parse <<-'GRAPHQL'
      query {
        repository(owner: "captaincontrat", name:"captaincontrat") {
          pullRequests(last:5) {
            edges {
              node {
                ...Github::Queries::PullRequests::PullRequestFragment
              }
            }
          }
        }
      }
    GRAPHQL
    end
  end
end
