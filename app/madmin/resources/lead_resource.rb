# frozen_string_literal: true

class LeadResource < Madmin::Resource
  model Lead

  attribute :id, form: false
  attribute :name, form: false
  attribute :email, form: false
  attribute :email_normalized, form: false
  attribute :created_at, form: false

  menu label: "Leads", position: 5

  def self.display_name(record)
    record.email
  end
end
