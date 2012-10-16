class PassivoCirculanteOperacionalsController < ApplicationController
  # GET /passivo_circulante_operacionals
  # GET /passivo_circulante_operacionals.json
  def index
    @passivo_circulante_operacionals = PassivoCirculanteOperacional.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @passivo_circulante_operacionals }
    end
  end

  # GET /passivo_circulante_operacionals/1
  # GET /passivo_circulante_operacionals/1.json
  def show
    @passivo_circulante_operacional = PassivoCirculanteOperacional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @passivo_circulante_operacional }
    end
  end

  # GET /passivo_circulante_operacionals/new
  # GET /passivo_circulante_operacionals/new.json
  def new
    @passivo_circulante_operacional = PassivoCirculanteOperacional.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @passivo_circulante_operacional }
    end
  end

  # GET /passivo_circulante_operacionals/1/edit
  def edit
    @passivo_circulante_operacional = PassivoCirculanteOperacional.find(params[:id])
  end

  # POST /passivo_circulante_operacionals
  # POST /passivo_circulante_operacionals.json
  def create
    @passivo_circulante_operacional = PassivoCirculanteOperacional.new(params[:passivo_circulante_operacional])

    respond_to do |format|
      if @passivo_circulante_operacional.save
        format.html { redirect_to @passivo_circulante_operacional, notice: 'Passivo circulante operacional was successfully created.' }
        format.json { render json: @passivo_circulante_operacional, status: :created, location: @passivo_circulante_operacional }
      else
        format.html { render action: "new" }
        format.json { render json: @passivo_circulante_operacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /passivo_circulante_operacionals/1
  # PUT /passivo_circulante_operacionals/1.json
  def update
    @passivo_circulante_operacional = PassivoCirculanteOperacional.find(params[:id])

    respond_to do |format|
      if @passivo_circulante_operacional.update_attributes(params[:passivo_circulante_operacional])
        format.html { redirect_to @passivo_circulante_operacional, notice: 'Passivo circulante operacional was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @passivo_circulante_operacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passivo_circulante_operacionals/1
  # DELETE /passivo_circulante_operacionals/1.json
  def destroy
    @passivo_circulante_operacional = PassivoCirculanteOperacional.find(params[:id])
    @passivo_circulante_operacional.destroy

    respond_to do |format|
      format.html { redirect_to passivo_circulante_operacionals_url }
      format.json { head :ok }
    end
  end
end
