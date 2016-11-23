defmodule Tweet do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Tweet.Worker.start_link(arg1, arg2, arg3)
      # worker(Tweet.Worker, [arg1, arg2, arg3]),
      worker(Tweet.TweetServer, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    Tweet.Scheduler.schedule_file("* * * * *", Path.join("#{:code.priv_dir(:tweet)}", "sample.txt"))

    process
  end
end
