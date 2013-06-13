class DashboardController < ApplicationController

	before_filter :authenticate_user!
 
def index 
@qrcodes = Qrcode.all  
end
end
