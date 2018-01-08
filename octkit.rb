require 'octokit'
client = Octokit::Client.new login: 'reviewers-test-account', password: 'r19930528'
puts pulls = client.user.pulls
pulls.each do |pull|
  puts pull.id
  puts pull.title
  puts pull.url
  puts pull.repository_url
  puts pull.labels_url
  puts pull.comments_url
  puts pull.events_url
  puts pull.html_url
  puts pull.id
  puts pull.number
  puts pull.user
end
