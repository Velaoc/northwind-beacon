# Seeds are optional: this application boots, migrates, and serves every page
# with a completely empty database, and nothing here is required in
# production.
#
# The first operator account is promoted from the console on purpose; there is
# deliberately no seeded administrator, password, or API key anywhere in this
# repository.

# Demo waitlist leads so the operator inbox (/admin/leads) shows real data.
# Skipped when the table does not exist yet (pre-migration bootstraps).
if ActiveRecord::Base.connection.data_source_exists?(:leads)
  Lead.find_or_create_by!(email_normalized: "alex.rivera@example.com") do |lead|
    lead.name = "Alex Rivera"
    lead.email = "alex.rivera@example.com"
  end

  Lead.find_or_create_by!(email_normalized: "morgan.lee@example.com") do |lead|
    lead.name = "Morgan Lee"
    lead.email = "morgan.lee@example.com"
  end
end
