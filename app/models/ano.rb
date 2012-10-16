class Ano < ActiveRecord::Base
validates_numericality_of :ano, :message => "O campo ano e numerico"
validates_uniqueness_of :ano, :message =>"este ano ja existe"
validates_length_of :ano, :is => 4, :message => "O campo ano tem que ter quatro numeros"
  has_many :analise_financeiras

end
