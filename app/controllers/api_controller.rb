class ApiController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def find
    @qrcode = Qrcode.find_by_ref(params[:r]);		
    render json: @qrcode	
  end

  def geotag

    @qrcode = Qrcode.find_by_ref(params[:r])

    if @qrcode.userid == current_user.userid
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
  else
  render :json => {:success => false, :message => "Not Owner of QRCode"}
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

def updatescore
 currid = current_user.id
 score = Leaderboard.find_or_create_by_user_id(:user_id => currid)

      if score.username == nil
        score.username = current_user.email

      end
      if score.score == nil 
        score.score = 0
      else
        newScore = score.score + 1
        score.score = newScore
      end
      score.save
     
      @leaderboard = Leaderboard.select("score,username")
                  .order('score desc')
      render json: @leaderboard
end







	

end
