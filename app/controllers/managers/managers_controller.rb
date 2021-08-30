class Managers::ManagersController < ApplicationController
  before_action :set_manager, only: [:edit, :update, :destroy, :show]  

  def index
  @managers = Manager.all
  end
   
  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    generated_password = Devise.friendly_token.first(8)
    @manager.password = generated_password

    respond_to do |format|
      if @manager.save
        ManagerMailer.new_user_password(@manager.id, generated_password).deliver
        format.html { redirect_to managers_manager_path(@manager), notice: 'Manager Added Successfully ' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to  managers_manager_path(@manager), notice: 'Manager Updated Successfully ' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_managers_path, notice: 'Admin Deleted Successfully' }
      format.json { head :no_content }
    end
  end

  private

  def set_manager
    @manager = Manager.find(params[:id])
  end

  def manager_params
    params.require(:manager).permit(:first_name, :last_name, :email, :role_id)
  end
end
