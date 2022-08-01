# AuthApi

Criando uma API com autenticação por JWT no Elixir.

### Dependencies
Phoenix, Ecto, Guardian e Pbkdf2(hash das senhas).



### Setup:

#### Português:

  * Instalar deps usando `mix deps.get`
  * Ajustas as credencias de acesso ao banco de dados no arquivo "config/dev.exs" linha 4.
  * Criar o banco de dados e realizar as migrações com `mix ecto.setup`
  * Iniciar o endpoint phoenix com `mix phx.server` ou dentro do IEx usando `iex -S mix phx.server`

Para acessar utilize a URL [`localhost:4000`](http://localhost:4000) no seu browser.



#### English:

  * Install dependencies with `mix deps.get`
  * Adjust your database credentials at "config/dev.exs" line 4.
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
