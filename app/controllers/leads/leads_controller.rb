# frozen_string_literal: true

module Leads
  # Captures waitlist signups from the landing page. Public, no
  # authentication: the landing page itself is a marketing page.
  class LeadsController < ApplicationController
    def create
      @lead = Lead.new(lead_params)

      if @lead.save
        redirect_to root_path, notice: "You're on the list. We'll send an invite when Beacon opens."
      else
        @existing = Lead.find_by(email_normalized: @lead.email_normalized)
        redirect_to root_path, notice: "You're already on the list — we'll be in touch."
      end
    end

    private

    def lead_params
      params.require(:lead).permit(:name, :email)
    end
  end
end
