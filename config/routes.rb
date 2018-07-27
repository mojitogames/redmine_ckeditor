RedmineApp::Application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'
  get 'ckeditor/user_autocomplete', to: 'ckeditor#user_autocomplete'
  post 'ckeditor/upload', :to => 'ckeditor#upload'
end
