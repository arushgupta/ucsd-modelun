ActiveAdmin.register_page "Dashboard" do
 
 menu parent: "Settings"
 
  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span ("Hi, there!")
        br()
        span ("Welcome to UCSD MUN Admin Panel.")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end
end
