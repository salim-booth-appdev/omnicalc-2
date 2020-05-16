Rails.application.routes.draw do

get("/web", { :controller => "magic", :action => "web_form" })

post("/process_web", { :controller => "magic", :action => "web_results" })
  
get("/text", { :controller => "magic", :action => "text_form" })

post("/process_text", { :controller => "magic", :action => "text_results" })

get("/label", { :controller => "magic", :action => "label_form" })

post("/process_label", { :controller => "magic", :action => "label_results" })


  # =============================

  root("vision#homepage")

  get("/vision/:detector", { :controller => "vision", :action => "form" })
  post("/vision/:detector", { :controller => "vision", :action => "magic" })

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
