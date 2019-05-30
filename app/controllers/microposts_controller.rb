class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
  
    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
         #request.referrer is related to the request.original_url variable used in friendly forwarding (Section 10.2.3), 
         # and is just the previous URL (in this case, the Home page)
    end

    private
        def micropost_params
            params.require(:micropost).permit(:content, :picture)
        end

        def correct_user
            @micropost = current_user.microposts.find_by(id: params[:id]) #get the post being deleted
            redirect_to root_url if @micropost.nil?
        end
end
