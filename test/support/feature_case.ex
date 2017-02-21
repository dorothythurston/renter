defmodule Renter.FeatureCase do
  use ExUnit.CaseTemplate, async: false

  using do
    quote do
      use Renter.ConnCase

      use Hound.Helpers

      import FeatureHelpers

      import Renter.Gettext

      hound_session
    end
  end
end
