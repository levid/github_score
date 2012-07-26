class GithubLoader
  def events_for(username)
    raw_json  = `curl https://github.com/#{username}.json`
    json      = JSON.parse(raw_json)
  end
end
