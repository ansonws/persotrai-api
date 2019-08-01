class Api::V1::LessonsController < Api::ApplicationController

    before_action :find_lesson, only: [ :destroy, :show, :update ]

    def create
        @lesson = Lesson.new lesson_params
        @lesson.user = current_user
        @id = params[:trainer]
        @trainer = Trainer.find(@id)
        @lesson.trainer = @trainer
            if @lesson.save
                # @lesson.request!
                render json: { status:201, id: @review.id }
            else
                render(
                    json: { errors: user.errors.messages },
                    status: 422 # Unprocessable Entity
                  )
            end
    end

    def show
        render(
            json: @lesson,
            include: [ {user: [ :user ]}, {trainer: [ :trainer ]} ]
          )
    end

    def edit
    end
  
    def update
        @lesson.update!(trainer_params)
        render json: { id: @trainer.id }
    end

    def destroy
        @lesson.destroy
        render json: { status: 200 }
    end

    def approve
        @lesson = Lesson.find(params[:lesson])
        @id = params[:user]
        @user = User.find(@id)
        @lesson.user = @user
         if @lesson.update lesson_params
            @lesson.approve!
            render json: { status:201, id: @review.id }
        else
            render(
                json: { errors: user.errors.messages },
                status: 422 # Unprocessable Entity
              )
        end
    end

    def decline
        @lesson = Lesson.find(params[:lesson])
        @id = params[:user]
        @user = User.find(@id)
        @lesson.user = @user
         if @lesson.update lesson_params
            @lesson.decline!
            render json: { status:201, id: @review.id }
        else
            render(
                json: { errors: user.errors.messages },
                status: 422 # Unprocessable Entity
              )
        end
    end

    def approve
        @lesson = Lesson.find(params[:lesson])
        @id = params[:user]
        @user = User.find(@id)
        @lesson.user = @user
         if @lesson.update lesson_params
            @lesson.approve!
            render json: { status:201, id: @review.id }
        else
            render(
                json: { errors: user.errors.messages },
                status: 422 # Unprocessable Entity
              )
        end
    end

    def pay
        @lesson = Lesson.find(params[:lesson])
        @id = params[:teacher]
        @teacher = Teacher.find(@id)
        @lesson.user = User.find(params[:id])
         if @lesson.update lesson_params
            render json: { status:201, id: @review.id }
        else
            render(
                json: { errors: user.errors.messages },
                status: 422 # Unprocessable Entity
              )
        end
    end

    def finish
        @lesson = Lesson.find(params[:lesson])
        @teacher_id = params[:teacher]
        @teacher = Teacher.find(@teacher_id)
        @lesson.teacher = @teacher
        @user_id = params[:user]
        @user = User.find(@user_id)
        @lesson.user = @user
         if @lesson.update lesson_params
            @lesson.finish!
            render json: { status:201, id: @review.id }
        else
            render(
                json: { errors: user.errors.messages },
                status: 422 # Unprocessable Entity
              )
        end
    end

    def done

    end

  
    private

    def find_lesson
        @lesson ||= Lesson.find params[:id]
    end

    def lesson_params
        params.require(:lesson).permit(:comment) #:answer)
    end
  
end
