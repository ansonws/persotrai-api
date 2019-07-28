class Api::V1::FavouritesController < Api::ApplicationController
    def create
        trainer = Trainer.find params[:trainer_id]
        favourite = Favourite.new user: current_user, trainer: trainer
        favourite.save!
        render json: { status:201, id: favourite.id }
        end
      end

      def destroy
        favourite = Favourite.find params[:id]
        favourite.destroy
        render json: { status: 200 }
      end
end
