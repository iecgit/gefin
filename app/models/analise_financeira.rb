class AnaliseFinanceira < ActiveRecord::Base
validates_numericality_of :empresa_id, :ano_id, :estoque, :caixa, :imposto_renda_contribuicao_social,
 :passivo_exigivel_longo_prazo,
  :ativo_permanente, :patrimonio_liquido, :aplicacoes, :lucro_liquido,
   :lucro_antes_imposto_renda, :despesas_financeiras, :lucro_bruto, :lucro_operacional, :vendas_liquidas, :message =>"Este campo tem que ser numerico"
  belongs_to :empresa
  belongs_to :ano
  has_many :ativo_circulante_operacionals
  has_many :ativo_circulante_financeiros
  has_many :passivo_circulante_operacionals
  has_many :passivo_circulante_financeiros

  def empresaAno
    "#{empresa.nome} - #{ano.ano}"
  end

  def calcularAtivoCirculante
    #Este método é usado para calcular o Ativo Circulante,
    #que será mostrado para o usuário

    ativo_circulante = (calcularTotalACOs + calcularTotalACFs)
    ativo_circulante
  end

  def calcularTotalACOs
    #Este método é usado para calcular a soma dos Ativos Circulantes
    #Operacionais, que será usado pelo método calcularAtivoCirculante

    total = 0
    ativo_circulante_operacionals.each do |ativo_circulante_operacional|
      total = total + ativo_circulante_operacional.valor
    end
    total
  end

  def calcularTotalACFs
    #Este método é usado para calcular a soma dos Ativos Circulantes
    #Financeiros, que será usado pelo método calcularAtivoCirculante

    total = 0
    ativo_circulante_financeiros.each do |ativo_circulante_financeiro|
      total = total + ativo_circulante_financeiro.valor
    end
    total = total + caixa + estoque # caixa e estoque são ACFs e devem
      #ser somados
    total
  end

  def calcularCapitalCirculanteLiquido
    #Este método é usado para calcular o Capital Circulante Liquidoa
    #que será mostrado para o usuário

    capital_circulante_liquido = (calcularAtivoCirculante -
      calcularPassivoCirculante)
    capital_circulante_liquido
  end

  def calcularPassivoCirculante
    #Este método é usado para calcular o Passivo Circulante
    #que será usado pelo método calcularCapitalCirculanteLiquido

    passivo_circulante = ( calcularTotalPCOs + calcularTotalPCFs)
    passivo_circulante
  end

  def calcularTotalPCOs
    #Este método é usado para calcular a soma dos PCOs
    #que será usado pelo método calcularPassivoCirculante

    total = 0
    passivo_circulante_operacionals.each do |passivo_circulante_operacional|
      total = total + passivo_circulante_operacional.valor
    end
    total
  end

  def calcularTotalPCFs
    #Este método é usado para calcular a soma dos PCFs
    #que será usado pelo método calcularPassivoCirculante

    total = 0
    passivo_circulante_financeiros.each do |passivo_circulante_financeiro|
      total = total + passivo_circulante_financeiro.valor
    end
    total
  end

  def calcularIndiceCorberturaJuros
    #Este método é usado para calcular o Indice de Corbertura de Jurosa
    #que será mostrado para o usuário

    indice_corbertura_juros =
      calcularLucroAntesJurosImpostoRenda / despesas_financeiras
    indice_corbertura_juros
  end

  def calcularLucroAntesJurosImpostoRenda
    #Este método é usado para calcular o LAJIR
    #Lucro Antes do Juros e Imposto de Renda
    #que será usado pelo método calcularIndiceCorberturaJuros

    lucro_antes_juros_imposto_renda =
      lucro_antes_imposto_renda + despesas_financeiras
    lucro_antes_juros_imposto_renda
  end

  def calcularIndiceEndividamentoGeral
    #Este método é usado para calcular o Indice de Endividamento Geral
    #IEG que será mostrado para o usuário

    indice_enividamento_geral = calcularPassivoTotal / calcularAtivoTotal
    indice_enividamento_geral
  end

  def calcularPassivoTotal
    #Este método é usado para calcular o Passivo Total
    #que será usado pelo método calcularIndiceEndividamentoGeral

    passivo_total = calcularPassivoCirculante + calcularPassivoPermanente
    passivo_total
  end

  def calcularPassivoPermanente
    #Este método é usado para calcular o Passivo Permanente
    #PP que será usado pelo método calcularPassivoTotal

    passivo_permanente = passivo_exigivel_longo_prazo + patrimonio_liquido
    passivo_permanente
  end

  def calcularAtivoTotal
    #Este método é usado para calcular o Ativo Total
    #que será usado pelo método calcularIndiceEndividamentoGeral

    ativo_total = calcularAtivoCirculante + ativo_permanente
    ativo_total
  end

  def calcularIndiceLiquidezCorrente
    #Este método é usado para calcular o Indice de Liquidez Corrente
    #ILC que será mostrado para o usuário

    indice_liquidez_corrente =
      calcularAtivoCirculante / calcularPassivoCirculante
    indice_liquidez_corrente
  end

  def calcularIndiceLiquidezImediata
    #Este método é usado para calcular o Indice de Liquidez Imediata
    #ILI que será mostrado para o usuário

    indice_liquidez_imediata =
      (caixa + aplicacoes) / calcularPassivoCirculante
    indice_liquidez_imediata
  end

  def calcularIndiceLiquidezSeca
    #Este método é usado para calcular o Indice de Liquidez Seca
    #ILS que será mostrado para o usuário

    indice_liquidez_seca =
      (calcularAtivoCirculante - estoque) / calcularPassivoCirculante
    indice_liquidez_seca
  end

  def calcularMargemLucroBruto
    #Este método é usado para calcular o Indice de Liquidez Seca
    #ILS que será mostrado para o usuário

    margem_lucro_bruto = lucro_bruto / vendas_liquidas
    margem_lucro_bruto
  end

  def calcularMargemLucroLiquido
    #Este método é usado para calcular o Indice de Liquidez Seca
    #ILS que será mostrado para o usuário

    margem_lucro_liquido = lucro_liquido / vendas_liquidas
    margem_lucro_liquido
  end

  def calcularMargemLucroOperacional
    #Este método é usado para calcular o Indice de Liquidez Seca
    #ILS que será mostrado para o usuário

    margem_lucro_operacional = lucro_operacional / vendas_liquidas
    margem_lucro_operacional
  end

  def calcularNecessidadeInvestimentoCapitalGiro
    #Este método é usado para calcular a Necessidade de Investimento em
    #Capital de Giro (NIG) que será mostrado para o usuário

    necessidade_investimento_capital_giro =
      calcularTotalACOs - calcularTotalPCOs
    necessidade_investimento_capital_giro
  end

  def calcularNecessidadeTotalFinanciamentoPermanente
    #Este método é usado para calcular a Necesidade Total de
    #Financiamento Permanente (NTFP) que será mostrado para o usuário

    necesidade_total_financiamento_permanente =
      calcularNecessidadeInvestimentoCapitalGiro + ativo_permanente
    necesidade_total_financiamento_permanente
  end

  def calcularRetornoSobreAtivoTotal
    #Este método é usado para calcular o Retorno Sobre o Ativo Total
    #(Return on Assets) e deve ser apresentado como percentual %
    #que será mostrado para o usuário

    retorno_sobre_ativo_total = (lucro_liquido * 100)/ calcularAtivoTotal
    retorno_sobre_ativo_total
  end

  def calcularRetornoSobreCapitalProprio
    #Este método é usado para calcular o Retorno Sobre o Capital Proprio
    #(ROE) e deve ser apresentado como percentual %
    #que será mostrado para o usuário

    retorno_sobre_capital_proprio= (lucro_liquido * 100)/ patrimonio_liquido
    retorno_sobre_capital_proprio
  end

  def calcularSaldoDisponivel
    #Este método é usado para calcular o Saldo Disponivel
    #(SD) que será mostrado para o usuário

    saldo_disponivel = (passivo_exigivel_longo_prazo -
      calcularNecessidadeTotalFinanciamentoPermanente)
    saldo_disponivel
  end

  def calcularPercentualACO
    #Este método é usado para calcular o percentual
    #do Ativo Circulante Operacional para ser usado no gráfico
    #da Analise de Financiamento

    percentual_aco = (calcularTotalACOs / calcularAtivoTotal) * 100
    percentual_aco
  end

  def calcularPercentualACF
    #Este método é usado para calcular o percentual
    #do Ativo Circulante Financeiro para ser usado no gráfico
    #da Analise de Financiamento

    percentual_acf = (calcularTotalACFs / calcularAtivoTotal) * 100
    percentual_acf
  end

  def calcularPercentualAP
    #Este método é usado para calcular o percentual
    #do Ativo Permanente para ser usado no gráfico
    #da Analise de Financiamento

    percentual_ap = (ativo_permanente / calcularAtivoTotal) * 100
    percentual_ap
  end

  def calcularPercentualPC
    #Este método é usado para calcular o percentual
    #do Passivo Circulante para ser usado no gráfico
    #da Analise de Financiamento

    percentual_pc = (calcularPassivoCirculante / calcularPassivoTotal) * 100
    percentual_pc
  end

  def calcularPercentualELP
    #Este método é usado para calcular o percentual
    #do Exigivel a Longo Prazo para ser usado no gráfico
    #da Analise de Financiamento

    percentual_elp = (passivo_exigivel_longo_prazo / calcularPassivoTotal) * 100
    percentual_elp
  end

  def calcularPercentualPL
    #Este método é usado para calcular o percentual
    #do Patrimonio Liquido para ser usado no gráfico
    #da Analise de Financiamento

    percentual_pl = (patrimonio_liquido / calcularPassivoTotal) * 100
    percentual_pl
  end

end
