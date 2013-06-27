class QrcodesController < ApplicationController

  before_filter :authenticate_user!
  # GET /qrcodes
  # GET /qrcodes.json
  def index
    #@qrcodes = Qrcode.find_all_by_userid(current_user.id)
    @qrcodes= Qrcode.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qrcodes }
    end
  end

  

  # GET /qrcodes/1
  # GET /qrcodes/1.json
  def show
    @qrcode = Qrcode.find(params[:id])

    if @qrcode.imgloc == nil
      @qrcode.imgloc = request.protocol+request.host_with_port+request.fullpath+".png"
      @qrcode.save
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qrcode }
      format.png  { render :qrcode => @qrcode.ref }
    end
  end

  # GET /qrcodes/new
  # GET /qrcodes/new.json
  def new
    @qrcode = Qrcode.new
    @quests= Quest.find_all_by_userid(current_user)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @qrcode }
    end
  end

  # GET /qrcodes/1/edit
  def edit
    @qrcode = Qrcode.find(params[:id])
    @auth=true
    @quests= Quest.all
    if @qrcode.userid == current_user.id
      @auth=true
    else
      @auth=false
    end
  end

  # POST /qrcodes
  # POST /qrcodes.json
  def create
    @qrcode = Qrcode.new(params[:qrcode])
    @qrcode.userid = current_user.id

    respond_to do |format|
      if @qrcode.save
        format.html { redirect_to @qrcode, notice: 'Qrcode was successfully created.' }
        format.json { render json: @qrcode, status: :created, location: @qrcode }
      else
        format.html { render action: "new" }
        format.json { render json: @qrcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /qrcodes/1
  # PUT /qrcodes/1.json
  def update
    @qrcode = Qrcode.find(params[:id])

    respond_to do |format|
      if @qrcode.update_attributes(params[:qrcode])
        format.html { redirect_to @qrcode, notice: 'Qrcode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qrcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrcodes/1
  # DELETE /qrcodes/1.json
  def destroy
    @qrcode = Qrcode.find(params[:id])
    @qrcode.destroy

    respond_to do |format|
      format.html { redirect_to qrcodes_url }
      format.json { head :no_content }
    end
  end


end
