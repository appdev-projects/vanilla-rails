class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.by_user(current_user.id)
    render json: @tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    #@task = current_user.tasks.find(params[:id])
    render json: @task
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    #@task = current_user.tasks.build(task_params)
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end

#    respond_to do |format|
#      if @task.save
#        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
#        format.json { render :show, status: :created, location: @task }
#      else
#        format.html { render :new, status: :unprocessable_entity }
#        format.json { render json: @task.errors, status: :unprocessable_entity }
#      end
#    end

  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end

#    respond_to do |format|
#      if @task.update(task_params)
#        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
#        format.json { render :show, status: :ok, location: @task }
#      else
#        format.html { render :edit, status: :unprocessable_entity }
#        format.json { render json: @task.errors, status: :unprocessable_entity }
#      end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:body, :commenter_id, :completed_id, :in_progress_id, :incomplete_id, :status)
    end
end
