class Api::V1::TrainersController < ApplicationController
    before_action :find_trainer, only: [:show, :edit, :update, :destroy]

    def new 
        @trainer = Trainer.new
      end
  
      def create
          @trainer = Trainer.new trainer_params
          if @trainer.save
              session[:trainer_id] = @trainer.id
              flash[:success] = "Registration successful!"
              redirect_to root_path
          else
              render :new
          end
      end
  
    def show
      @review = Review.new
      @reviews = @trainer.reviews.order(created_at: :desc)
      @favourite = @trainer.favourites.find_by_user_id current_user if user_signed_in?

      unless @trainer.reviews.empty?
      @avg_rating = @trainer.reviews.average(:rating).floor(2).to_f
      end

    end
  
    def index
      @trainer = Trainer.all

      @trainer.each do|trainer|
        unless trainer.reviews.empty?
          @avg_rating = trainer.reviews.average(:rating).floor(2).to_f
        end
      end
      
        # if params[:price]
        #   @language = Language.find_or_initialize_by(name: params[:language])
        #   @trainer= @language.teachers.order(price: :ASC)
        # elsif params[:rating]
        #   ratings = []
        #   @teachers = []
        #   @language = Language.find_or_initialize_by(name: params[:language])
        #   teachers = @language.teachers
        #   teachers.each do |t|
        #     if t.reviews.length == 0
        #       ratings << {id: t.id, rating: 0}
        #     else
        #       total = 0
        #       count = 0
        #       t.reviews.each do |r|
        #         total += r.rating
        #         count +=1
        #       end
        #       ratings << {id: t.id, rating: total/count}
        #     end
        #   end
        #   ratings = ratings.sort_by{|r| -r[:rating]}
        #   ratings.each do |rating|
        #     @teachers << @language.teachers.find(rating[:id])
        #   end
          
        # elsif params[:language]
        #   @language = Language.find_or_initialize_by(name: params[:language])
        #   @teachers= @language.teachers.order(created_at: :DESC)
        # else
          @trainers = Trainer.order(created_at: :DESC)
        end

      
    def edit
      # if !can?(:edit, @question)
      #   redirect_to root_path, alert: 'Not authorized'
      # end
    end
  
    def update
      if @trainer.update trainer_params
        redirect_to trainer_path(@trainer.id)
      else
        render :edit
      end
    end
  
    def destroy
      @trainer.destroy
      redirect_to trainers_path
    end

    def trainer_dashboard
      if user_signed_in?
        @trainer = current_user
        # @requested_lessons = @trainer.lessons.where(aasm_state: "requested")
        # @approved_lessons = @trainer.lessons.where(aasm_state: "approved")
        # @payed_lessons = @trainer.lessons.where(aasm_state: "payed")
      end
    end

    private
  
    def trainer_params
      params.require(:trainer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :description, :price, :area)

    end

  
    def find_teacher
      @teacher = Teacher.find(params[:id])
    end

    def average_rating
      @teachers.each do|teacher|
        @avg_rating = teacher.reviews.average(:rating).floor(2).to_f
      end
    end
end
