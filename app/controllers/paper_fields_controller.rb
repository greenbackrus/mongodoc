class PaperFieldsController < ApplicationController
    def index
      paper_fields = PaperField.all
      render json: paper_fields, status: 200
    end
    def show
      paper_field = PaperField.find(params[:id])
      render json: paper_field, status: 200
    end
    def create
      paper_field = PaperField.new(paper_field_params)
      if paper_field.save
        render json: paper_field, status: 201, location: paper_field
      else
         render json: paper_field.errors, status: 422
      end
    end
    def edit
    end
    def update
      paper_field = PaperField.find(params[:id])
      if paper_field.update(paper_field_params)
        render json: paper_field, status: 200
      else
         render json: paper_field.errors, status: 422
      end
    end
    def destroy
      paper_field = PaperField.find(params[:id])
      paper_field.destroy  
      head 204
    end
    private
      def paper_field_params
        params.require(:paper_field).permit(:, :, )
      end
end
