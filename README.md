# Tweet

**Sample Elixir application built following the PluralSight course.

It sends tweets from a text file.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `tweet` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:tweet, "~> 0.1.0"}]
    end
    ```

  2. Ensure `tweet` is started before your application:

    ```elixir
    def application do
      [applications: [:tweet]]
    end
    ```

