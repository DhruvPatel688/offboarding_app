class OffboardingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offboarding, only: %i[ show edit update destroy ]

  def index
    @offboardings = current_user_offboardings
  end

  def show; end

  def new
    @offboarding = Offboarding.new
    @employees = current_user.employees
  end

  def edit
    @employees = current_user.employees
  end

  def create
    @offboarding = Offboarding.new(offboarding_params)
    @offboarding.created_by = current_user

    respond_to do |format|
      if @offboarding.save
        format.html { redirect_to @offboarding, notice: "Offboarding was successfully created." }
        format.json { render :show, status: :created, location: @offboarding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @offboarding.update(offboarding_params)
        format.html { redirect_to @offboarding, notice: "Offboarding was successfully updated." }
        format.json { render :show, status: :ok, location: @offboarding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offboarding.destroy!
    respond_to do |format|
      format.html { redirect_to offboardings_path, status: :see_other, notice: "Offboarding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def current_user_offboardings
      Offboarding.where(created_by: current_user)
    end

    def set_offboarding
      @offboarding = current_user_offboardings.find(params[:id])
    end

    def offboarding_params
      params.require(:offboarding).permit(:employee_id, :due_date, :status)
    end
end
