class CreateAnaliseFinanceiras < ActiveRecord::Migration
  def change
    create_table :analise_financeiras do |t|
      t.references :empresa
      t.references :ano
      t.float :estoque
      t.float :caixa
      t.float :imposto_renda_contribuicao_social
      t.float :passivo_exigivel_longo_prazo
      t.float :ativo_permanente
      t.float :patrimonio_liquido
      t.float :aplicacoes
      t.float :lucro_liquido
      t.float :lucro_antes_imposto_renda
      t.float :despesas_financeiras
      t.float :lucro_bruto
      t.float :lucro_operacional
      t.float :vendas_liquidas

      t.timestamps
    end
    add_index :analise_financeiras, :empresa_id
    add_index :analise_financeiras, :ano_id
  end
end
