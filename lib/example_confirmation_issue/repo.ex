defmodule ExampleConfirmationIssue.Repo do
  use Ecto.Repo,
    otp_app: :example_confirmation_issue,
    adapter: Ecto.Adapters.Postgres
end
