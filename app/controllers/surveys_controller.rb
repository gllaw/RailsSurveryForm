class SurveysController < ApplicationController

  def main
    session[:counter] = 0 unless session[:counter]    #changing it from nil 
  end

  def create
    session[:counter] += 1

    person = Survey.new(survey_params)
    if person.save
      flash[:success] = "You have successfully submitted the form #{session[:counter]} times."
      redirect_to "/surveys/#{person.id}"
    else
      flash[:errors] = person.errors.full_messages
      redirect_to :back
    end
  end

  def show
  	@success_message = flash[:success]
    @person = Survey.find(params[:id])
  end

  private
  def survey_params
    params.require(:survey).permit(:name, :location, :language, :comment)
  end

end
