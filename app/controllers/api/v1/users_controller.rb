class Api::V1::UsersController < ApplicationController

    before_action :find_user, only: [:update,:update_password]

    def new 
        @user = User.new
      end
  
      def create
          @user = User.new user_params
          if @user.save
              session[:user_id] = @user.id
              flash[:success] = "Registration successful!"
              redirect_to root_path
          else
              render :new
          end
      end
  
      def edit
      end
    
      def update
         if @user.update user_params       
          flash[:success] = "Your profile was updated successfully!"
          redirect_to dashboard_user_path(@user)
        else
          render :edit
        end
      end
  
      def change_password
      
      end
      
      def update_password
        if @user&.authenticate(params[:current_password])
          if params[:new_password] == params[:current_password]
            flash[:danger] = 'New password cannot be the same as old password!'
            render :change_password
          else  
            check_and_update_password
          end
        else
          flash[:danger] = "Your current password is invalid!"
          render :change_password
        end
      end
  
      
      def dashboard
        @favourited_trainers = current_user.favourited_trainers.order("favourites.created_at DESC")
        @trainer = current_user.favourited_trainers
  
        # @requested_lessons = @user.lessons.where(aasm_state: "requested")
        # @approved_lessons = @user.lessons.where(aasm_state: "approved")
        # @declined_lessons = @user.lessons.where(aasm_state: "declined")
        # @confirmed_lessons = @user.lessons.where(aasm_state: "payed")
        # @finished_lessons = @user.lessons.where(aasm_state: "finished")
  
        
      end
  
      private
  
      def user_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
      end
      def find_user
          @user = User.find(current_user.id)
      end
  
      def check_and_update_password
          if params[:new_password] == params[:new_password_confirmation]
            if @user.update(password: params[:new_password])
              flash[:success] = "Password updated!"
              redirect_to edit_user_path(current_user)
            else  
              flash[:danger] = @user.errors.full_messages.join(', ')
              render :change_password
            end
          else
            flash[:danger] = "Password confirmation does not match new password!"
            render :change_password
          end
      end
end
