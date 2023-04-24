class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
  
    def create_membership
      membership = Membership.new(membership_params)
      if membership.save
        render json: membership, status: :created
      else
        render json: membership.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def membership_params
      params.require(:membership).permit(:gym_id, :client_id, :membership_charge)
    end
  
    def render_invalid_record(exception)
      render json: { error: exception.message }, status: :unprocessable_entity
    end
  end
  