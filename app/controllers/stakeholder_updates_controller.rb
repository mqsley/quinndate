class StakeholderUpdatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @stakeholder_update = StakeholderUpdate.new
  end


  def create
    project = current_user.default_project
    stakeholder_update = project.stakeholder_updates.create!(stakeholder_update_params)
    redirect_to stakeholder_update_path(stakeholder_update), notice: 'created'
  end

  def show
    project = current_user.default_project
    @stakeholder_update = project.stakeholder_updates.find(params[:id])
  end

  private

    def stakeholder_update_params
      params.require(:stakeholder_update).permit(:content)
    end


end
