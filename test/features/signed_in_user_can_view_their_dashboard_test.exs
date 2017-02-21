defmodule ViewDashboardTest do
  use Renter.FeatureCase
  import Renter.Factory

  test "user can view their dashboard", %{conn: conn} do
    user = insert(:user)
    navigate_to dashboard_path(conn, :show, as: user.id)

    assert visible_page_text =~ gettext("Welcome")
    assert role_visible?("sign-out")
  end
end
