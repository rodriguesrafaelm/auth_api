defmodule AuthApiWeb.SessionView do
  use AuthApiWeb, :view

  def render("token.json", %{access_token: access_token}) do
    %{access_token: access_token}
  end

end
