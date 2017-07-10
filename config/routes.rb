Rails.application.routes.draw do
  resources :shorteneds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/shorteneds/:short_url' => 'shorteneds#show'
end
