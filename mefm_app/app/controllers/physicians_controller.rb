class PhysiciansController < ApplicationController
  # before_action :authenticate_user!

  def index
    @physicians = Physician.all
    if params[:search]
      @physicians = Physician.search(params[:search]).order("created_at DESC")
    else
      @physicians = Physician.all.order('created_at DESC')
    end
  end

  def edit
    @physician = Physician.find(params[:id])
  end

  def new
    @physician = Physician.new
  end

  def show
    @physician = Physician.find(params[:id])
  end

  def update
    @physician = Physician.find(params[:id])
    if @physician.update(physician_params)
      redirect_to @physician, notice: "Physician was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @physician = Physician.find(params[:id])
    @physician.delete
    redirect_to physicians_path
    flash[:notice] = "Physician was successfully deleted."
  end

  # POST /physcians
  def create
    @physician = Physician.new(physician_params)
    @physician.user = current_user

    if @physician.save
      redirect_to root_path,
      notice: 'Physician was successfully created.'
    else
      render :new
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def physician_params
    params.required(:physician).permit(:first_name, :last_name, :search)
  end

end
