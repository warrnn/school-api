module Api
    module V1
        class SubjectsController < ApplicationController
            # READ
            def index
                @subjects = Subject.all
                render json: @subjects
            end

            # CREATE
            def create
              @subject = Subject.new(subject_params)

              if @subject.save
                    render json: @subject
              else
                    render json: @subject.errors, status: :unprocessable_entity
              end
            end

            # READ BY ID
            def show
                @subject = Subject.find(params[:id])
                render json: @subject
            end

            # UPDATE
            def update
                @subject = Subject.find(params[:id])

                if @subject.update(subject_params)
                    render json: @subject
                else
                    render json: @subject.errors, status: :unprocessable_entity
                end
            end

            # DELETE
            def destroy
                @subject = Subject.find(params[:id])

                if @subject.present?
                    @subject.destroy
                    render json: @subject
                else
                    render json: { error: "Subject not found" }, status: :not_found
                end
            end

            private
            def subject_params
                params.require(:subject).permit(:name)
            end
        end
    end
end
