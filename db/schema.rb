# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111212235752) do

  create_table "analise_financeiras", :force => true do |t|
    t.integer  "empresa_id"
    t.integer  "ano_id"
    t.float    "estoque"
    t.float    "caixa"
    t.float    "imposto_renda_contribuicao_social"
    t.float    "passivo_exigivel_longo_prazo"
    t.float    "ativo_permanente"
    t.float    "patrimonio_liquido"
    t.float    "aplicacoes"
    t.float    "lucro_liquido"
    t.float    "lucro_antes_imposto_renda"
    t.float    "despesas_financeiras"
    t.float    "lucro_bruto"
    t.float    "lucro_operacional"
    t.float    "vendas_liquidas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "analise_financeiras", ["ano_id"], :name => "index_analise_financeiras_on_ano_id"
  add_index "analise_financeiras", ["empresa_id"], :name => "index_analise_financeiras_on_empresa_id"

  create_table "anos", :force => true do |t|
    t.integer  "ano"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ativo_circulante_financeiros", :force => true do |t|
    t.string   "descricao"
    t.float    "valor"
    t.integer  "analise_financeira_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ativo_circulante_financeiros", ["analise_financeira_id"], :name => "index_ativo_circulante_financeiros_on_analise_financeira_id"

  create_table "ativo_circulante_operacionals", :force => true do |t|
    t.string   "descricao"
    t.float    "valor"
    t.integer  "analise_financeira_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ativo_circulante_operacionals", ["analise_financeira_id"], :name => "index_ativo_circulante_operacionals_on_analise_financeira_id"

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passivo_circulante_financeiros", :force => true do |t|
    t.string   "descricao"
    t.float    "valor"
    t.integer  "analise_financeira_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passivo_circulante_financeiros", ["analise_financeira_id"], :name => "index_passivo_circulante_financeiros_on_analise_financeira_id"

  create_table "passivo_circulante_operacionals", :force => true do |t|
    t.string   "descricao"
    t.float    "valor"
    t.integer  "analise_financeira_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passivo_circulante_operacionals", ["analise_financeira_id"], :name => "index_passivo_circulante_operacionals_on_analise_financeira_id"

end
