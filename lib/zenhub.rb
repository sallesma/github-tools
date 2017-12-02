require 'net/http'
require 'uri'

module Zenhub
  BASE_URL = 'https://api.zenhub.io'
  PERSONAL_ACCESS_TOKEN = ENV['ZENHUB_AUTH_TOKEN']
  REPO_ID = ENV['REPO_ID']

  def self.board_data
    url = File.join(BASE_URL, "/p1/repositories/#{REPO_ID}/board")
    get(url)
  end

  def self.get(url)
    uri = URI.parse(url)

    request = Net::HTTP::Get.new(uri.to_s, {'X-Authentication-Token' => PERSONAL_ACCESS_TOKEN})
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true

    response = https.request(request)
    JSON.parse(response.body)
  end
end
