class YearsController < ApplicationController


  before_action :set_year, only: [:show]

  def show
    if params[:grade]
      @students = @year.students.where(school_year: params[:grade])
      else
      @students = @year.students    
    end
    @students = @students.sort_by(&:sport)
  	@year_number = @year.number
  end

  def index
  end


  private

  def set_year
  	@year = Year.find(params[:id])
  end

  def year_params
  	params.require(:year).permit(:number,:id,:grade)
  end
end
