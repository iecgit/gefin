class Empresa < ActiveRecord::Base
validates_presence_of :nome, :message =>"Campo Obrigatorio"
validates_uniqueness_of :nome, :message =>"Esta empresa ja existe"
validates_length_of :nome, :in => 3..100, :message =>"o campo nome tem que estar entre 3 e 100 caracteres"
 has_many :analise_financeiras
end
