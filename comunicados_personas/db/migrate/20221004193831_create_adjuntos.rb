class CreateAdjuntos < ActiveRecord::Migration[7.0]
  def change
    create_table :adjuntos do |t|
      t.references :comunicado, null: false, foreign_key: {to_table: :comunicados}
    end
  end
end
