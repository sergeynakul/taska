Rails.application.routes.draw do
  get 'search/period_accuracy_form'
  get 'search/weekly_rankings_form'
  get 'search/period_accuracy_output'
  get 'search/weekly_rankings_output'
  root to: 'home#index'
end
