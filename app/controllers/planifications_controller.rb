class PlanificationsController < ApplicationController
  before_action :set_planification, only: [:show, :edit, :update, :destroy]
  before_action :set_expected_learnings, only: [:add_lecture, :new, :edit]

  def add_lecture
    @planification = Planification.new
    @planification.lectures.build
    @grade = session[:gst_grade]
    @subject = session[:gst_subject]

    render 'add_lecture', layout: false
  end

  # GET /planifications
  # GET /planifications.json
  def index
    @user = current_user
    @review = Review.new
    @subjects = Subject.all.uniq.pluck(:name)
    @schools = School.all.uniq.pluck(:name)
    @grades = Grade.all.uniq.pluck(:name)
    @planifications = Planification.search(params)
  end

  # GET /planifications/1
  # GET /planifications/1.json
  def show
    # En vez de renderizar HTML para las vistas del show, renderiza pretty JSON.
    # Luego:
    # + Mostrar además los campos no propios a la planificación (school.{name,
    # address, corporation}, user.{name, lastname}, etc)
    # + Generar documento 'imprimible' (.doc?, .pdf?) a partir de este
    # documento JSON
    respond_to do |format|
      format.json do
        render json: JSON.pretty_generate(
              JSON.parse(
                JSON.parse(@planification.to_json(include: { lectures: {except: [:expected_learning_id, :created_at, :updated_at]} }, except: [:lecture_id]) )
                    .merge(school_name: 'Liceo_420', sostenedor: 'Snoop Dogg').to_json
                    )
        )
      end

      format.html { render :show }

      format.pdf do
        render pdf: "planificacion",
               encoding: "utf-8",
               page_size: "Letter"
      end
    end

  end

  # GET /planifications/new
  def new
    @planification = Planification.new
    @grades_subjects_teacher = GradesSubjectsTeacher.find(params[:grades_subjects_teacher_id])
    session[:gst_grade] = @grades_subjects_teacher.grade.name
    session[:gst_subject] = @grades_subjects_teacher.subjects_teacher.subject.name
  end

  # GET /planifications/1/edit
  def edit
    @n_lectures = @planification.lectures.length
    @grades_subjects_teacher = @planification.grades_subjects_teacher
  end

  # POST /planifications
  # POST /planifications.json
  def create
    @gst = GradesSubjectsTeacher.find(params[:gst])
    @planification = @gst.planifications.build(planification_params)
    @planification.subject = @gst.subjects_teacher.subject.name
    @planification.school = @gst.subjects_teacher.subject.school.name
    @planification.grade = @gst.grade.name
    respond_to do |format|
      if @planification.save
        format.html { redirect_to @gst , notice: 'Planification was successfully created.' }
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
        format.html { redirect_to @planification.grades_subjects_teacher, notice: 'Planification was successfully updated.' }
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
      format.html { redirect_to @planification.grades_subjects_teacher, notice: '¡Planification fue exitosamente eliminada!' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_planification
    @planification = Planification.find(params[:id])
  end

  def set_expected_learnings
    @expected_learnings = ExpectedLearning.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def planification_params
    params.require(:planification).permit(:name, :date, :rating, :downloads, :state, :utpcomment,
    lectures_attributes: [:id, :lectures, :objectives, :starting, :developing,
    :grades_subjects_teacher_id, :finalizing, :content, :resources, :duration, :evaluation ])
  end


end
