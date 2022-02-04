class CatsController < ApplicationController

    def index
        cats = Cat.all
        render json: cats
    end
  
    def create
        cat = Cat.create(cat_params)
        render json: cat
    end
  
    def update
        cat = Cat.find(params[:id])
        cat.update(cat_params)
        # Don't forget to wrap each option for the ternary in () or it doesn't work properly
        cat.valid? ? (render json: cat) : (render json: cat.errors, status: 422)
    end
  
    def destroy
    end


    private 

    def cat_params
    params.require(:cat).permit(:name, :age, :enjoys, :image)
    end
  
  end
