class Api::V1::TrainersController < API::ApplicationController
    # before_action :authenticate_user!, only: [:create, :destroy, :update ]
    before_action :find_teacher, only: [ :destroy, :show, :update ]
  
    def index
      trainers = Trainer.order(created_at: :desc)
  
      render(
        json: trainers,
        each_serializer: TrainerCollectionSerializer
      )
    end
  
    def show
      render(
        json: @trainer,

        include: [ {reviews: [ :student ]}, {favourites: [ :student ]} ]
        # include: [ :teacher, {favourites: [ :student ]} ], {availabilities: [ :student ]} 
        # include: [ :teacher, {availabilities: [ :student ]} ]
      )
    end
  
    def create
      trainer = Trainer.new trainer_params
      trainer.user = current_user
  
      trainer.save!
      render json: { status:201, id: trainer.id }
    end
  
    def update
      @trainer.update!(trainer_params)
      render json: { id: @trainer.id }
    end
  
    def destroy
      @trainer.destroy
      render json: { status: 200 }
    end
  
    private

    # def current_user
    #   @user = User.find(current_user.id)
    #   @current_user ||= User.find(session[user_id])
    # end

    def find_trainer
      @trainer ||= Trainer.find params[:id]
    end
  
    def trainer_params
      params.require(:trainer).permit(:price, :description, :area)
    end
  
end
