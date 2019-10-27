class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request
  before_action :set_project, only: %i[destroy]

  def index
    render json: ProjectSerializer.new(Project.all).serialized_json, status: :ok
  end

  def show
    endpoint operation: Projects::Operation::Show, options: {
      params: params, current_user: @current_user
    }, different_handler: show_handler
  end

  def create
    endpoint operation: Projects::Operation::Create, options: {
      params: params, current_user: @current_user
    }
  end

  def update
    endpoint operation: Projects::Operation::Update, options: {
      params: params, current_user: @current_user
    }
  end

  def destroy
    endpoint operation: Projects::Operation::Destroy, options: {
      params: params, current_user: @current_user
    }
  end

  private

  def show_handler
    {
      success: ->(result) { render json: ProjectSerializer.new(result['model']).serialized_json, status: :ok },
      invalid: ->(_) { render json: { errors: 'Project not found' }, status: :not_found }
    }
  end

  def default_handler
    {
      success: ->(result) { render json: ProjectSerializer.new(result['model']).serialized_json, status: :ok },
      invalid: lambda { |result|
        render json: { errors: result['contract.default'].errors.full_messages }, status: :unprocessable_entity
      }
    }
  end

  def set_project
    @project = @current_user.projects.find_by(id: params[:id])
  end

  def project_params
    params.permit(:name, :user_id)
  end
end
