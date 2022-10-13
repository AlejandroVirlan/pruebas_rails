class Persona < ApplicationRecord
    has_many :comunicados_creados, class_name: :Comunicado, foreign_key: :creador_id
    has_many :comunicados_recibidos, class_name: :Comunicado, foreign_key: :receptor_id 
end
