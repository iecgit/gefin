class AtivoCirculanteFinanceirosController < ApplicationController
  # GET /ativo_circulante_financeiros
  # GET /ativo_circulante_financeiros.json
  def index
    @ativo_circulante_financeiros = AtivoCirculanteFinanceiro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ativo_circulante_financeiros }
    end
  end

  # GET /ativo_circulante_financeiros/1
  # GET /ativo_circulante_financeiros/1.json
  def show
    @ativo_circulante_financeiro = AtivoCirculanteFinanceiro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ativo_circulante_financeiro }
    end
  end

  # GET /ativo_circulante_financeiros/new
  # GET /ativo_circulante_financeiros/new.json
  def new
    @ativo_circulante_financeiro = AtivoCirculanteFinanceiro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ativo_circulante_financeiro }
    end
  end

  # GET /ativo_circulante_financeiros/1/edit
  def edit
    @ativo_circulante_financeiro = AtivoCirculanteFinanceiro.find(params[:id])
  end

  # POST /ativo_circulante_financeiros
  # POST /ativo_circulante_financeiros.json
  def create
    @ativo_circulante_financeiro = AtivoCirculanteFinanceiro.new(params[:ativo_circulante_financeiro])

    respond_to do |format|
      if @ativo_circulante_financeiro.save
        format.html { redirect_to @ativo_circulante_financeiro, notice: 'Ativo circulante financeiro was successfully created.' }
        format.json { render json: @ativo_circulante_financeiro, status: :created, location: @ativo_circulante_financeiro }
      else
        format.html { render action: "new" }
        format.json { render json: @ativo_circulante_financeiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ativo_circulante_financeiros/1
  # PUT /ativo_circulante_financeiros/1.json
  def update
    @ativo_circulante_financeiro = AtivoCirculanteFinanceiro.find(params[:id])

    respond_to do |format|
      if @ativo_circulante_financeiro.update_attributes(params[:ativo_circulante_financeiro])
        format.html { redirect_to @ativo_circulante_financeiro, notice: 'Ativo circulante financeiro was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ativo_circulante_financeiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ativo_circulante_financeiros/1
  # DELETE /ativo_circulante_financeiros/1.json
  def destroy
    @ativo_circulante_financeiro = AtivoCirculanteFinanceiro.find(params[:id])
    @ativo_circulante_financeiro.destroy

    respond_to do |format|
      format.html { redirect_to ativo_circulante_financeiros_url }
      format.json { head :ok }
    end
  end
end
