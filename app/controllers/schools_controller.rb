# SchoolsController
class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show

    # Para que el prof. no pueda ver el código del colegio ingresando
    # a la URL del colegio en formato JSON, sólo TODOS los datos del
    # colegio son accesibles con request AJAX.
    respond_to do |format|
      if request.xhr?
        format.html { render :show }
        format.json { render json: @school }
      else
        authorize! :read, School
        format.html { render :show }
        format.json { render nothing: true }
      end
    end
  end

  # GET /schools/new
  def new
    authorize! :create, School
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
    authorize! :update, @school
  end

  # POST /schools
  # POST /schools.json
  def create
    authorize! :create, School
    @user = current_user
    @school = @user.schools.build(school_params)
    @school.user_id = @user.id
    @user.schools << @school
    respond_to do |format|
      if @school.save
        format.html do
          redirect_to users_schools_path(@user), notice: 'Colegio creado con éxito.'
        end
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json do
          render json: @school.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    authorize! :update, @school

    respond_to do |format|
      if @school.update(school_params)
        format.html do
          redirect_to @school, notice: 'Colegio editado con éxito'
        end
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json do
          render json: @school.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    authorize! :destroy, @school
    @school.destroy
    respond_to do |format|
      format.html do
        redirect_to schools_url, notice: 'Escuela eliminada con éxito.'
      end
      format.json { head :no_content }
    end
  end

  def send_code_email
    # En la Web Console del browser tirará un "no element found"..
    # esto porque no sabe qué renderizar al llegar a esta ruta,
    # pero el email se envía igual.
    @prof = User.find_by_id(params[:prof_id])
    @school = School.find_by_id(params[:school_id])
    CodeMailer.school_code_email(@prof, @school).deliver_later
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def school_params
    params.require(:school).permit(:name, :RBD, :address, :phone, :code)
  end
end
