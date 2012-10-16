class CreatePassivoCirculanteFinanceiros < ActiveRecord::Migration
  def change
    create_table :passivo_circulante_financeiros do |t|
      t.string :descricao
      t.float :valor
      t.references :analise_financeira

      t.timestamps
    end
    add_index :passivo_circulante_financeiros, :analise_financeira_id
  end
end
