class ApiController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def find
    @qrcode = Qrcode.find_by_ref(params[:r]);		
    render json: @qrcode	
  end

  def geotag
    @qrcode = Qrcode.find_by_ref(params[:r])
    if @qrcode	
     @qrcode.Long = params[:long]
     @qrcode.lat = params[:lat]
     if @qrcode.save
      render :json => {:success => true, :message => "Updated Geotag successfully"}
     else
      render :json => {:success => false, :message => "Updated Geotag unsuccessfully"}
     end    
    else
      render :json => {:success => false, :message => "Couldn't find the reference"}
    end
end

def qrcodes
  @qrcodes= Qrcode.find_all_by_quest_id(params[:quest_id])	
  render json: @qrcodes		
end

def quests
  @quests = Quests.all
  render json: quests
end


def location
  @result = Qrcode.select('Long, lat')
                .where("quest_id=?", params[:quest_id])
  render json: @result

end







	

end
