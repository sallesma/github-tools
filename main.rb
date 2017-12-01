require 'dotenv/load'
require 'byebug'
require_relative './lib/github'


HeroNameQuery = Github::Client.parse <<-'GRAPHQL'
  query {
    repository(owner:"octocat", name:"Hello-World") {
      issues(last:20, states:CLOSED) {
        edges {
          node {
            title
            url
            labels(first:5) {
              edges {
                node {
                  name
                }
              }
            }
          }
        }
      }
    }
  }
GRAPHQL
result = Github::Client.query(HeroNameQuery)
byebug
puts 'bye'
