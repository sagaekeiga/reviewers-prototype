class Engineers::PullrequestsController < ApplicationController
  def show
    @pullrequest = Company.first.pullrequests.find(params[:id])
    @pr = @pullrequest.crawl
  end
end
