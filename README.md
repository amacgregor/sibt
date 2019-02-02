# ShouldIBuildThat.io (SIBT.IO)


## Uberauth Setup

### Facebook

https://github.com/ueberauth/ueberauth_facebook

1. Add Facebook to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        facebook: {Ueberauth.Strategy.Facebook, []}
      ]
    ```

1.  Update your provider configuration (ENV.secret.exs):

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
      client_id: System.get_env("FACEBOOK_CLIENT_ID"),
      client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")
    ```
    
    
### Github
https://github.com/ueberauth/ueberauth_github

1. Add GitHub to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        github: {Ueberauth.Strategy.Github, []}
      ]
    ```

1.  Update your provider configuration:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Github.OAuth,
      client_id: System.get_env("GITHUB_CLIENT_ID"),
      client_secret: System.get_env("GITHUB_CLIENT_SECRET")
    ```
