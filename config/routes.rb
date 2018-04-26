Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "quotes#classify"
  get '/classify' => 'quotes#classify', as: :classify
  post '/classify' => 'quotes#categorize'

end
