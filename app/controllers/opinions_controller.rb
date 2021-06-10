class OpinionsController < ApplicationController  
    def create
      @opinion = current_user.opinions.build(opinion_params)
      if @opinion.save
        redirect_to root_path
      else
        flash.now[:alert] = 'Something went wrong'
      end
    end
  
    private
  
    def opinion_params
      params.require(:opinion).permit(:text)
    end
end