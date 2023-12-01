class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      redirect_to search_path(query: params[:query])
    end
  end
end
