class AtivoCirculanteOperacionalsController < ApplicationController
  # GET /ativo_circulante_operacionals
  # GET /ativo_circulante_operacionals.json
  def index
    @ativo_circulante_operacionals = AtivoCirculanteOperacional.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ativo_circulante_operacionals }
    end
  end

  # GET /ativo_circulante_operacionals/1
  # GET /ativo_circulante_operacionals/1.json
  def show
    @ativo_circulante_operacional = AtivoCirculanteOperacional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ativo_circulante_operacional }
    end
  end

  # GET /ativo_circulante_operacionals/new
  # GET /ativo_circulante_operacionals/new.json
  def new
    @ativo_circulante_operacional = AtivoCirculanteOperacional.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ativo_circulante_operacional }
    end
  end

  # GET /ativo_circulante_operacionals/1/edit
  def edit
    @ativo_circulante_operacional = AtivoCirculanteOperacional.find(params[:id])
  end

  # POST /ativo_circulante_operacionals
  # POST /ativo_circulante_operacionals.json
  def create
    @ativo_circulante_operacional = AtivoCirculanteOperacional.new(params[:ativo_circulante_operacional])

    respond_to do |format|
      if @ativo_circulante_operacional.save
        format.html { redirect_to @ativo_circulante_operacional, notice: 'Ativo circulante operacional was successfully created.' }
        format.json { render json: @ativo_circulante_operacional, status: :created, location: @ativo_circulante_operacional }
      else
        format.html { render action: "new" }
        format.json { render json: @ativo_circulante_operacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ativo_circulante_operacionals/1
  # PUT /ativo_circulante_operacionals/1.json
  def update
    @ativo_circulante_operacional = AtivoCirculanteOperacional.find(params[:id])

    respond_to do |format|
      if @ativo_circulante_operacional.update_attributes(params[:ativo_circulante_operacional])
        format.html { redirect_to @ativo_circulante_operacional, notice: 'Ativo circulante operacional was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ativo_circulante_operacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ativo_circulante_operacionals/1
  # DELETE /ativo_circulante_operacionals/1.json
  def destroy
    @ativo_circulante_operacional = AtivoCirculanteOperacional.find(params[:id])
    @ativo_circulante_operacional.destroy

    respond_to do |format|
      format.html { redirect_to ativo_circulante_operacionals_url }
      format.json { head :ok }
    end
  end
end
