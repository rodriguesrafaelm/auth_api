defmodule AuthApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias AuthApi.Repo

  alias AuthApi.Accounts.User

  def create_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get_user_by_email(email) do
    query = from u in User, where: u.email == ^email

    case Repo.one(query) do
      nil -> {:error, "Usuário não encontrado"}
      user -> {:ok, user}
    end
  end

  def get_by_id!(id) do
    User
    |> Repo.get!(id)
  end

  def authenticate_user(email, password) do
    with {:ok, user} <- get_user_by_email(email) do
      case validate_password(password, user.password) do
        false -> {:error, :unauthorized}
        true -> {:ok, user}
      end
    end
  end

  defp validate_password(password, encypted_password) do
    Pbkdf2.verify_pass(password, encypted_password)
  end

end
