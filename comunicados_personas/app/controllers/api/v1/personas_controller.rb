class Api::V1::PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :update, :destroy]

  def index
    @personas = Persona.all

    render json: @personas
  end

  def show
    render json: @persona
  end

  def create
    @persona = Persona.new(persona_params)

    if @persona.save
        render json: @persona, status: :created, location: @persona
    else
        render json: @persona.errors, status: :unprocessable_entity
    end
  end

  def update
    if @persona.update(persona_params)
        render json: @persona
    else
        render json: @persona.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_persona
        @persona = Persona.find(params[:id])
    end

    def persona_params
        params.require(:persona).permit(:nombre, :fecha_nacimiento)
    end
end
