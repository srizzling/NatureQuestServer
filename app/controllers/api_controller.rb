class ApiController < ApplicationController
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
		end
		render :json => {:success => false, :message => "Couldn't find the reference"}
	end

	def all
		@qrcodes= Qrcode.all		
		render json: @qrcodes		
	end







	#==========================================================================

	#Authenication

	#==========================================================================

	def login
      email = params[:email]
      password = params[:password]
      if request.format != :json
        render :status=>406, :json=>{:message=>"The request must be json"}
        return
       end
 
    if email.nil? or password.nil?
       render :status=>400,
              :json=>{:message=>"The request must contain the user email and password."}
       return
    end
 
    @user=User.find_by_email(email.downcase)
 
    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:message=>"Invalid email or passoword."}
      return
    end
 
    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!
 
    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
    else
      render :status=>200, :json=>{:token=>@user.authentication_token}
    end
  end
 
  def logout
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?      
      render :status=>404, :json=>{:message=>"Invalid token"}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end


end
