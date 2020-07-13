class Api::UnitsController < ApplicationController
  def destroy
    Unit.find(params[:id]).delete
    redirect_to units_path
  end
end
