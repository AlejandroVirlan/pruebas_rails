class Comunicado < ApplicationRecord
    belongs_to :creador_id, class_name: :Persona, foreign_key: :creador_id
    belongs_to :receptor_id, class_name: :Persona, foreign_key: :receptor_id
    belongs_to :comunicado, class_name: :Comunicado, optional: true

    has_one :comunicado_anterior, class_name: :Comunicado, foreign_key: :comunicado
    
    has_many :adjuntos
end
