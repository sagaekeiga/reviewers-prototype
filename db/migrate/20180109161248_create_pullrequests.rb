class CreatePullrequests < ActiveRecord::Migration[5.1]
  def change
    create_table :pullrequests do |t|
      t.references :company, foreign_key: true
      t.integer :pull_request_id
      t.string :title
      t.string :url
      t.string :html_url
      t.string :diff_url
      t.string :patch_url
      t.string :issue_url
      t.string :commits_url
      t.string :review_comments_url
      t.string :review_comment_url
      t.string :comments_url
      t.string :statuses_url
      t.string :commits_url
      t.string :number
      t.string :state
      t.string :body
      t.string :events_url
      t.string :html_url
      t.timestamps
    end
  end
end
