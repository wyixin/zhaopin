class UploadsController < ApplicationController

  def index
    if params[:upload_file].present?
      file_path = uploadFile(params[:upload_file])

      render json: {
                 :success=>true,
                 :file_path=>"/upload/#{file_path}"
             }
    end
  end
end
