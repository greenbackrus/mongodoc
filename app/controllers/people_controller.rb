class PeopleController < ApplicationController
    def index
      people = Person.all
      render json: people, status: 200
    end
    def show
      people = People.find(params[:id])
      render json: people, status: 200
    end
    def create
      people = Person.new(people_params)
      if people.save
        render json: people, status: 201, location: people
       else
         render json: people.errors, status: 422
      end
    end
    def edit
    end
    def update
      people = Person.find(params[:id])
      if people.update(people_params)
        render json: people, status: 200
      else
         render json: people.errors, status: 422
      end
    end
    def destroy
      people = Person.find(params[:id])
      people.destroy  
      head 204
    end
    private
      def people_params
        params.require(:people).permit(:text)
      end
end
