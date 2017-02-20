defmodule ViewDashboardTest do
  use Renter.FeatureCase
  import Renter.Factory

  test "user can view their dashboard" do
    user = insert(:user)
    user_navigate_to "/", as: user

    assert visible_page_text =~ gettext("Welcome")
    assert role_visible?("sign-out")
  end
end
