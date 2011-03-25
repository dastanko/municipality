class AssetsController < ApplicationController
  def show
    asset = Asset.find(params[:id])
    #do security check here
    send_file asset.asset.path, :type => asset.asset_content_type
  end
 
  #this will be called via ajax/remote
  def destroy
    asset = Asset.find(params[:id])
    @allowed = Asset::Max_Attachments - asset.attachable.assets.count
 
    @report = asset.attachable
    if asset.destroy
      respond_to do |format|
        format.html do
          if request.xhr?
            #get attachable item again to ensure we get the new asset list
            render :partial => "assets/attachment", :collection => Report.find(@report.id).assets
          end
        end
      end
    else
      respond_to do |format|
        format.html do
          if request.xhr?
            render :json => asset.errors
          end
        end
      end
    end
  end
end