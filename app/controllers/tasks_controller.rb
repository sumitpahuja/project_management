class TasksController < ApplicationController
  respond_to :html, :json
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = developer? ? current_user.tasks : Task.all
    @developers = User.developer_names
    role = current_user.role_name.upcase + "_STATUS"
    @status = {}
    Task.const_get(role).each {|status| @status[status] = status.capitalize }
  end

  def show
  end

  def new
    @task = Task.new
    @projects = Project.incompleted
    @developers = User.developers
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

  def developers_task_status
    @developers_status = {}
    @developers = User.developers
    @developers.each do |user|
      @developers_status[user.id] = {unstarted: [], inprogress: [], completed: [] }
    end
    tasks = Task.where("developer_id is not null")
    tasks.each do |task|
      @developers_status[task.developer_id][task.status.to_sym] << task.name 
    end
  end 

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      if current_user.has_role? :admin
        params.require(:task).permit(:name, :start_date, :completed_date, :project_id, :developer_id, :estimation_in_hours, :status)
      else
        params.require(:task).permit(:start_date, :status)
      end      
    end   
end
