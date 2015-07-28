class CommitteesController < ApplicationController
  
  def download
      send_file(
        "#{Rails.root}/public/uploads/committee/#{params[:file]}",
        filename: "#{params[:file]}",
        type: "application/pdf"
      )
    end
end
