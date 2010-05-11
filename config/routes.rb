
Rails.application.routes.draw do |map|

  namespace :inkling do
    namespace :admin do
      resources :folders, :controller => 'folders'
      resources :inkling_folders, :controller => 'inkling_folders' #the inkling prefix is needed for any form operation
    end
  end

  puts "finished loading folder routes ****"
  match 'proxy_content_creation' => 'inkling/content_proxy#proxy', :as => :proxy_content_creation
end