class TasksController < ApplicationController
  respond_to :html, :json
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    @projects = Project.incompleted
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end 

  def update
    @task.update_attributes(task_params)
    respond_with @task
  end      

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :start_date, :winner_team, :completed, :project_id)
    end   
end
