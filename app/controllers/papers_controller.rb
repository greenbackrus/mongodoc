class PapersController < ApplicationController
    def index
      papers = Paper.all
      render json: papers, status: 200
    end
    def show
      paper = Paper.find(params[:id])
      render json: paper, status: 200
    end
    def create
      paper = Paper.new(paper_params)
      if paper.save
        render json: paper, status: 201, location: paper
      else
         render json: paper.errors, status: 422
      end
    end
    def edit
    end
    def update
      paper = Paper.find(params[:id])
      if paper.update(paper_params)
        render json: paper, status: 200
      else
         render json: paper.errors, status: 422
      end
    end
    def destroy
      paper = Paper.find(params[:id])
      paper.destroy  
      head 204
    end
    private
      def paper_params
        params.require(:paper).permit(:name)
      end
end
