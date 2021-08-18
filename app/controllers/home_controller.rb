class HomeController < ApplicationController
  def index
    @project ||= Project.new
  
  end


  private
  def resource_name 
    :project 
  end
  helper_method :resource_name

  def resource 
    @resource ||= Project.new
  end
  helper_method :resource 
  def devise_mapping 
    @devise_mapping ||= Devise.mappings[:project]
  end
  helper_method :devise_mapping 
  def resource_class 
    Project 
  end 
  helper_method :resource_class

  
end
