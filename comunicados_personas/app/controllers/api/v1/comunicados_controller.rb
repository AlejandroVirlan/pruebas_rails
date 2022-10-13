class Api::V1::ComunicadosController < ApplicationController
  before_action :set_comunicado, only: [:show, :update, :destroy]
  
  def index
    @comunicados = Comunicado.all
  
    render json: @comunicados
  end
  
  def show
    render json: @comunicado
  end
  
  def create
    @comunicado = Comunicado.new(comunicado_params)
  
    if @comunicado.save
        render json: @comunicado, status: :created, location: @comunicado
    else
        render json: @comunicado.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @comunicado.update(comunicado_params)
        render json: @comunicado
    else
        render json: @comunicado.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comunicado.destroy
  end

  # Recibe:   tipo (int)
  # Devuelve: nil
  # Objetivo: Mostrar los comunicados de las personas mayores de edad y el número de adjuntos total de los comunicados incluyendo el cero,
  #           pasando por parámetro el tipo de persona, ya sea receptor (0) o creador (1). Si se pasa cualquier otro número como tipo, aparece
  #           un mensaje de error informando de que el tipo introducido no es correcto.

  def show_notices
    aux_error = 1

    if params[:type] == '0'
      columna = :receptor_id
    elsif params[:type] == '1'
      columna = :creador_id
    else
      aux_error = -1
      @comunicados_data = 'Tipo incorrecto'
    end

    if aux_error != -1
      comunicados = Comunicado.left_outer_joins(columna, :adjuntos).where('fecha_nacimiento <= ?', Date.today - 18.years).distinct
      num_comunicados = Comunicado.joins(columna, :adjuntos).where('fecha_nacimiento <= ?', Date.today - 18.years).group(:id).count
      @comunicados_data = []

      comunicados.each do |comunicado|
        num_adjuntos = {"num_adjuntos" => num_comunicados[comunicado.id]  || 0}
        comunicado = JSON::parse(comunicado.to_json).merge(num_adjuntos)
        @comunicados_data << comunicado
      end
    end

    render json: @comunicados_data
  end

  # Recibe:   nil
  # Devuelve: nil
  # Objetivo: Mostrar los comunicados de las personas que hayan creado los comunicados, siendo mayores de edad y el número de adjuntos total 
  #           de los comunicados incluyendo el cero.

  def creator_notices 
    comunicados_creadores = Comunicado.left_outer_joins(:creador_id, :adjuntos).where('fecha_nacimiento <= ?', Date.today - 18.years ).distinct
    num_comunicados_creadores = Comunicado.joins(:creador_id, :adjuntos).where('fecha_nacimiento <= ?', Date.today - 18.years ).group(:id).count
    @comunicados_creadores_data = []

    comunicados_creadores.each do |comunicado|
      num_adjuntos = {"num_adjuntos" => num_comunicados_creadores[comunicado.id]  || 0}
      comunicado = JSON::parse(comunicado.to_json).merge(num_adjuntos)
      @comunicados_creadores_data << comunicado
    end

    render json: @comunicados_creadores_data
  end

  # Recibe:   nil
  # Devuelve: nil
  # Objetivo: Mostrar los comunicados de las personas que son receptores de los comunicados, siendo mayores de edad y el número de adjuntos total 
  #           de los comunicados incluyendo el cero.

  def reader_notices 
    comunicados_receptores = Comunicado.left_outer_joins(:receptor_id, :adjuntos).where('fecha_nacimiento <= ?', Date.today - 18.years ).distinct
    num_comunicados_receptores = Comunicado.joins(:receptor_id, :adjuntos).where('fecha_nacimiento <= ?', Date.today - 18.years ).group(:id).count
    @comunicados_receptores_data = []
    
    comunicados_receptores.each do |comunicado|
      num_adjuntos = {"num_adjuntos" => num_comunicados_receptores[comunicado.id]  || 0}
      comunicado = JSON::parse(comunicado.to_json).merge(num_adjuntos)
      @comunicados_receptores_data << comunicado
    end

    render json: @comunicados_receptores_data
  end

  # Recibe:   nil
  # Devuelve: nil
  # Objetivo: Mostrar el hilo de mensajes que haya entre dos personas.

  def show_threads
    id_comunicado = 10
    @comunicados_hilo = []

    while id_comunicado != nil
      comunicado = Comunicado.find(id_comunicado)
      @comunicados_hilo << comunicado
      id_comunicado = comunicado.comunicado_anterior_id
    end

    render json: @comunicados_hilo
  end
  
  private
    def set_comunicado
        @comunicado = Comunicado.find(params[:id])
    end
  
    def comunicado_params
        params.require(:comunicado).permit(:creador_id, :receptor_id, :asunto, :contenido, :comunicado_anterior_id)
    end
end