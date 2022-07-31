defmodule AuthApiWeb.UserController do
  use AuthApiWeb, :controller

  alias AuthApi.Accounts
  alias AuthApi.Accounts.User

  action_fallback AuthApiWeb.FallbackController

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> text("Usuário cadastrado com sucesso, usando o email:" <> " " <> user.email)

    end
  end

end
