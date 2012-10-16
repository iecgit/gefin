class CreateAtivoCirculanteOperacionals < ActiveRecord::Migration
  def change
    create_table :ativo_circulante_operacionals do |t|
      t.string :descricao
      t.float :valor
      t.references :analise_financeira

      t.timestamps
    end
    add_index :ativo_circulante_operacionals, :analise_financeira_id
  end
end
