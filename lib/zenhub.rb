require 'net/http'
require 'uri'

class Zenhub
  BASE_URL = 'https://api.zenhub.io'

  def initialize(access_token:, repository_id:)
    @access_token = access_token
    @repository_id = repository_id
  end

  def board_data
    url = File.join(BASE_URL, "/p1/repositories/#{@repository_id}/board")
    get(url)
  end

  private

  def get(url)
    uri = URI.parse(url)

    request = Net::HTTP::Get.new(uri.to_s, {'X-Authentication-Token' => @access_token})
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true

    response = https.request(request)
    JSON.parse(response.body)
  end
end
