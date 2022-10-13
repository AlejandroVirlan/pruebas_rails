class CreateComunicados < ActiveRecord::Migration[7.0]
  def change
    create_table :comunicados do |t|
      t.references :creador, null: false, foreign_key: {to_table: :personas}
      t.references :receptor, null: false, foreign_key: {to_table: :personas}
      t.string :asunto
      t.text :contenido
      t.references :comunicado_anterior, null: true, foreign_key: {to_table: :comunicados}
    end

  end
end
