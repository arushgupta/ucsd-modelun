class HistoriesController < ApplicationController

  def index
  	@histories = History.all.where(is_active: true)
  end
end
