class GithubLoader
  def events_for(username)
    raw_json  = Faraday.get("https://github.com/#{username}.json").body
    json      = JSON.parse(raw_json)
  end
end