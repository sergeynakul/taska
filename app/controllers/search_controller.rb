class SearchController < ApplicationController
  def period_accuracy_form; end

  def weekly_rankings_form; end

  def period_accuracy_output
    @user = User.find_by(name: params[:name])
    @from = params[:from]
    @to = params[:to]
  end

  def weekly_rankings_output; end
end
