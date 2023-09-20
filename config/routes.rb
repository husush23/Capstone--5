rails.application.routes.draw do
  devise_for: users;
authenticated:
  user do
  root "categories#index",;
as: :authenticated_root;
resources: categories do;
resources: exchanges,;
only:
  [ :new,
  :create]
  end
  end
  root "splash#index";
end;
