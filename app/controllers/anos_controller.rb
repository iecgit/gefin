class AnosController < ApplicationController
  # GET /anos
  # GET /anos.json
  def index
    @anos = Ano.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anos }
    end
  end

  # GET /anos/1
  # GET /anos/1.json
  def show
    @ano = Ano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ano }
    end
  end

  # GET /anos/new
  # GET /anos/new.json
  def new
    @ano = Ano.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ano }
    end
  end

  # GET /anos/1/edit
  def edit
    @ano = Ano.find(params[:id])
  end

  # POST /anos
  # POST /anos.json
  def create
    @ano = Ano.new(params[:ano])

    respond_to do |format|
      if @ano.save
        format.html { redirect_to @ano, notice: 'Ano was successfully created.' }
        format.json { render json: @ano, status: :created, location: @ano }
      else
        format.html { render action: "new" }
        format.json { render json: @ano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anos/1
  # PUT /anos/1.json
  def update
    @ano = Ano.find(params[:id])

    respond_to do |format|
      if @ano.update_attributes(params[:ano])
        format.html { redirect_to @ano, notice: 'Ano was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anos/1
  # DELETE /anos/1.json
  def destroy
    @ano = Ano.find(params[:id])
    @ano.destroy

    respond_to do |format|
      format.html { redirect_to anos_url }
      format.json { head :ok }
    end
  end
end
