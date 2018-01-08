require 'octokit'
client = Octokit::Client.new login: 'reviewers-test-account', password: 'r19930528'

# 全てのリポジトリを取得
repos = client.repos
# puts repos_rel = client.user.rels[:pulls_url]
# puts repos_rel.href
# puts repos_rel.get.data
repos.each do |repo|
  puts repo
  puts repo.name
  puts pull = client.pulls "#{repo.full_name}"
  puts pull.title
end
repos.each{|repo| client.pulls repo.full_name }
# 各リポジトリのPRを全て取得
# pulls = client.pull_requests
# client.pull_request('xxx/xxx', 'xxx')
# pulls.each do |pull|
#   puts pull
# end
# puts pulls = client.user.rels[:repos]
# pulls.each do |pull|
#   puts pull.id
#   puts pull.title
#   puts pull.url
#   puts pull.repository_url
#   puts pull.labels_url
#   puts pull.comments_url
#   puts pull.events_url
#   puts pull.html_url
#   puts pull.id
#   puts pull.number
#   puts pull.user
# end
