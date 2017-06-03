class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
private

def current_user
  User.new(session[:id])
end

helper_method :current_user
  protect_from_forgery with: :exception
end
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
authorize! :index, @project
  end
rescue_from CanCan::AccessDenied do |exception|
  flash[:warning] = exception.message
  redirect_to root_path
end
def new
  @project = Project.new
  authorize! :new, @project
end

def create
  @project = Project.new(project_params)
  if @project.save
    flash[:success] = 'Project was saved!'
    redirect_to root_path
  else
    render 'new'
  end
  authorize! :create, @project
end

private

def project_params
  params.require(:project).permit(:title)
end
end
