class Api::V1::AdjuntosController < ApplicationController
  before_action :set_adjunto, only: [:show, :update, :destroy]
  
  def index
    @adjuntos = Adjunto.all
    
    render json: @adjuntos
  end
    
  def show
    render json: @adjunto
  end
    
  def create
    @adjunto = Adjunto.new(adjunto_params)
    
    if @adjunto.save
        render json: @adjunto, status: :created, location: @adjunto
    else
        render json: @adjunto.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @adjunto.update(adjunto_params)
        render json: @adjunto
    else
        render json: @adjunto.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @adjunto.destroy
  end
    
  private
    def set_adjunto
        @adjunto = Adjunto.find(params[:id])
    end
    
    def adjunto_params
        params.require(:adjunto).permit(:comunicado_id)
    end
end
    