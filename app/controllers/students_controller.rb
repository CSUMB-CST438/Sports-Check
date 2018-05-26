class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  # GET /students
  # GET /students.json
  def index
    @students = []
    current_user.school.years.each do |year|
      @students << year.students
    end
    unless @students.empty?
      @students.flatten!.sort!
    end
    if current_user.school.years.empty?
      @year_number = Time.now.year
    else
      @year_number = current_user.school.years.all.pluck(:number).sort.last
    end
  end

  def show
  end

  # GET /students/new
  def new
    @student = Student.new()
  end

  # GET /students/1/edit
  def edit
  end

  def increase_student_year
    school_year = current_user.school.years.all.pluck(:number).sort.last
    @students = Year.find_by(number: school_year, school: current_user.school)
    if @students.nil?
      year = Year.create(school: current_user.school, number: (Time.now.year.to_i))
      redirect_to students_path
      return 
    end
    @students = @students.students
    year = Year.create(school: current_user.school, number: (school_year + 1))
    @students.all.each do |student|
      if student.school_year < 4
        s = student.dup
        s.school_year += 1
        s.save
        year.students << s
      end
    end
    year.save
    redirect_to students_path
  end

  def student_by_year
    school_year = params[:year]
    @students = Year.find(params[:year]).students
    year = Year.create(school: current_user.school, number: (school_year + 1))
    @students.all.each do |student|
      school_year += 1
      student.save
      if student.school_year < 4
        year.students << student
      end
    end
    year.save
    redirect_to students_path
  end 

  # POST /students
  # POST /students.json
  def create
    student_hash = student_params.to_h
    student_hash[:year] = Year.find_by(number: params[:student][:year].to_i, school: current_user.school)
    @student = Student.new(student_hash)
    @student.form.attach(params[:student][:form])
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      student_hash = student_params.to_h
      student_hash[:year] = Year.find_by(number: params[:student][:year].to_i, school: current_user.school)
      if @student.update(student_hash)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name,:gpa,:school_year,:doctor_note,:c_o_ethics, :cardiac, :concussion, :physical, :attendance,:sport,:year, :form)
    end
end
