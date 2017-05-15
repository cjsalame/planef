class PlanificationsController < ApplicationController
  before_action :set_planification, only: [:show, :edit, :update, :destroy]

  def add_lecture
    @planification = Planification.new
    @planification.lectures.build
    render "add_lecture", layout: false
  end

  # GET /planifications
  # GET /planifications.json
  def index
    @planifications = Planification.all
  end

  # GET /planifications/1
  # GET /planifications/1.json
  def show
    # En vez de renderizar HTML para las vistas del show, renderiza pretty JSON.
    # Luego:
    # + Mostrar además los campos no propios a la planificación (school.{name, address, corporation}, user.{name, lastname}, etc) 
    # + Generar documento "imprimible" (.doc?, .pdf?) a partir de este documento JSON
    render json: JSON.pretty_generate(
      JSON.parse(
        JSON.parse( @planification.to_json(include: {lectures: {except: [:expected_learning_id, :created_at, :updated_at]} }, except: [:lecture_id]) )
            .merge(school_name: "Liceo_420", sostenedor: "Snoop Dogg").to_json
      )
    )
  end

  # GET /planifications/new
  def new
    @planification = Planification.new
    # Está en el fields_for del form partial lectures/form
    # Lo dejo para borrarlo después
    # @planification.lectures.build
  end

  # GET /planifications/1/edit
  def edit
    @n_lectures = @planification.lectures.length
  end

  # POST /planifications
  # POST /planifications.json
  def create
    @planification = Planification.new(planification_params)

    respond_to do |format|
      if @planification.save
        format.html { redirect_to edit_planification_path(@planification) , notice: 'Planification was successfully created.' }
        format.json { render :show, status: :created, location: @planification }
      else
        format.html { render :new }
        format.json { render json: @planification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planifications/1
  # PATCH/PUT /planifications/1.json
  def update
    respond_to do |format|
      if @planification.update(planification_params)
        format.html { redirect_to @planification, notice: 'Planification was successfully updated.' }
        format.json { render :show, status: :ok, location: @planification }
      else
        format.html { render :edit }
        format.json { render json: @planification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planifications/1
  # DELETE /planifications/1.json
  def destroy
    @planification.destroy
    respond_to do |format|
      format.html { redirect_to planifications_url, notice: 'Planification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planification
      @planification = Planification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planification_params
      params.require(:planification).permit(:name, :date, :rating, :downloads, 
        lectures_attributes: [:id, :lectures, :objectives, :starting, :developing,
      :finalizing, :content, :resources, :duration, :evaluation ])
    end
end
