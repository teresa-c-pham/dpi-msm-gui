Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  # Directors GET and POST methods
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  post("/create_director", { :controller => "directors", :action => "create" })
  post("/modify_director/:path_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete_this" })

  # Movies GET and POST methods
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })

  post("/create_movie", { :controller => "movies", :action => "create" })
  post("/modify_movie/:path_id", { :controller => "movies", :action => "update" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete_this" })

  # Actors GET and POST methods
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })

  post("/create_actor", { :controller => "actors", :action => "create" })
  post("/modify_actor/:path_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete_this" })
end
