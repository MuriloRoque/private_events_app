class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = current_user.invitations.build(invitation_params)
    if @invitation.save
      flash[:success] = 'Invitation sent!'
      redirect_to current_user
    else
      flash.now[:danger] = 'There was a problem with your invite. Try again.'
      render :new
    end
  end

  private

	def invitation_params
		params.require(:invitation).permit(:attendee_id, :attended_event_id, :host_id)
	end

end
