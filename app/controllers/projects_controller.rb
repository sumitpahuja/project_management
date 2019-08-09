class ProjectsController < ApplicationController
  respond_to :html, :json
  before_action :set_project, only: [:show, :edit, :update, :destroy, :manage_team]


  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end  

  def update
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json {render json: {}, status: 200}
      else
        format.html { render :manage_team }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end    
  end  

  def manage_team
    @developers = User.developers
    @project_developers = @project.team_members
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :start_date, :description, :completed_date, :status, :created_by, team_member_ids: [])
    end  
end
