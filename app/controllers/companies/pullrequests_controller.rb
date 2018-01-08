class Companies::PullrequestsController < ApplicationController

  def new
    @pullrequest = current_company.pullrequests.new
  end

  def create
    @pullrequest = current_company.pullrequests.new(pullrequest_params)
    respond_to do |format|
      if @pullrequest.save
        format.html { redirect_to root_url, notice: t('.success') }
        format.json { render :show, status: :created, location: @pullrequest }
      else
        format.html { render :new }
        format.json { render json: @pullrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @pullrequest = current_company.pullrequests.find(params[:id])
    @pr = @pullrequest.crawl
  end

  private

  def pullrequest_params
    params.require(:pullrequest).permit(:url)
  end
end
