# frozen_string_literal: true

module Foundation
  # Landing page for Beacon: hero, features, pricing, FAQ, and the waitlist
  # signup. The marketing set replaces the template's minimal landing page.
  class HomeController < ApplicationController
    def show
      @lead = Lead.new
    end
  end
end
