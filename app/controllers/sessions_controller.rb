class SessionsController < ApplicationController

  respond_to :json




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

  def 

  def logout
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?      
      render :status=>404, :json=>{:message=>"Invalid token"}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end


  def signup
    @user = User.new()
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.ensure_authentication_token!

    if @user.save
      sign_in @user
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => @user,
                                 :auth_token => @user.authentication_token } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @user.errors.full_messages,
                        :data => {} }
    end
  end






  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
