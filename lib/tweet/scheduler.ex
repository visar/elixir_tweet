defmodule Tweet.Scheduler do
    def schedule_file(schedule, filepath) do
        Quantum.add_job(schedule,
            fn -> 
                Tweet.FileReader.get_strings_to_tweet(filepath)
                |> Tweet.TweetServer.tweet end)
    end
end