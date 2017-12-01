require "graphql/client"
require "graphql/client/http"

module Github
  PERSONAL_ACCESS_TOKEN = ENV['GITHUB_AUTH_TOKEN']

  HTTP = GraphQL::Client::HTTP.new('https://api.github.com/graphql') do
    def headers(_context)
      { "Authorization" => "bearer #{PERSONAL_ACCESS_TOKEN}" }
    end
  end

  Schema = GraphQL::Client.load_schema(HTTP)

  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end
