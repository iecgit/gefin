class PassivoCirculanteFinanceirosController < ApplicationController
  # GET /passivo_circulante_financeiros
  # GET /passivo_circulante_financeiros.json
  def index
    @passivo_circulante_financeiros = PassivoCirculanteFinanceiro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @passivo_circulante_financeiros }
    end
  end

  # GET /passivo_circulante_financeiros/1
  # GET /passivo_circulante_financeiros/1.json
  def show
    @passivo_circulante_financeiro = PassivoCirculanteFinanceiro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @passivo_circulante_financeiro }
    end
  end

  # GET /passivo_circulante_financeiros/new
  # GET /passivo_circulante_financeiros/new.json
  def new
    @passivo_circulante_financeiro = PassivoCirculanteFinanceiro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @passivo_circulante_financeiro }
    end
  end

  # GET /passivo_circulante_financeiros/1/edit
  def edit
    @passivo_circulante_financeiro = PassivoCirculanteFinanceiro.find(params[:id])
  end

  # POST /passivo_circulante_financeiros
  # POST /passivo_circulante_financeiros.json
  def create
    @passivo_circulante_financeiro = PassivoCirculanteFinanceiro.new(params[:passivo_circulante_financeiro])

    respond_to do |format|
      if @passivo_circulante_financeiro.save
        format.html { redirect_to @passivo_circulante_financeiro, notice: 'Passivo circulante financeiro was successfully created.' }
        format.json { render json: @passivo_circulante_financeiro, status: :created, location: @passivo_circulante_financeiro }
      else
        format.html { render action: "new" }
        format.json { render json: @passivo_circulante_financeiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /passivo_circulante_financeiros/1
  # PUT /passivo_circulante_financeiros/1.json
  def update
    @passivo_circulante_financeiro = PassivoCirculanteFinanceiro.find(params[:id])

    respond_to do |format|
      if @passivo_circulante_financeiro.update_attributes(params[:passivo_circulante_financeiro])
        format.html { redirect_to @passivo_circulante_financeiro, notice: 'Passivo circulante financeiro was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @passivo_circulante_financeiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passivo_circulante_financeiros/1
  # DELETE /passivo_circulante_financeiros/1.json
  def destroy
    @passivo_circulante_financeiro = PassivoCirculanteFinanceiro.find(params[:id])
    @passivo_circulante_financeiro.destroy

    respond_to do |format|
      format.html { redirect_to passivo_circulante_financeiros_url }
      format.json { head :ok }
    end
  end
end
