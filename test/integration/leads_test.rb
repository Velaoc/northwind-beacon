require "test_helper"

class LeadsTest < ActionDispatch::IntegrationTest
  test "landing page renders the marketing sections and waitlist form" do
    get root_path
    assert_response :success
    assert_select "h1", /Beacon finds your team/
    assert_select "h2", /Beacon/
    assert_select "form[action=?]", leads_path
    assert_select "input[name=?]", "lead[email]"
  end

  test "waitlist signup stores a lead" do
    assert_difference -> { Lead.count }, 1 do
      post leads_path, params: { lead: { name: "Ada Lovelace", email: "Ada@Example.com " } }
    end

    lead = Lead.last
    assert_equal "Ada Lovelace", lead.name
    assert_equal "ada@example.com", lead.email_normalized
    assert_redirected_to root_path
  end

  test "duplicate emails are not stored twice" do
    Lead.create!(name: "Ada", email: "ada@example.com")

    assert_no_difference -> { Lead.count } do
      post leads_path, params: { lead: { email: "ADA@example.com" } }
    end

    assert_redirected_to root_path
  end

  test "invalid emails are rejected" do
    assert_no_difference -> { Lead.count } do
      post leads_path, params: { lead: { email: "not-an-email" } }
    end
  end
end
