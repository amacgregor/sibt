# ShouldIBuildThat.io (SIBT.IO)
[![pipeline status](https://gitlab.com/bloccsio/shouldibuildthat/badges/master/pipeline.svg)](https://gitlab.com/bloccsio/shouldibuildthat/commits/master)
[![coverage report](https://gitlab.com/bloccsio/shouldibuildthat/badges/master/coverage.svg)](https://gitlab.com/bloccsio/shouldibuildthat/commits/master)

- Add your project logo.
- Write a short introduction to the project.
- If you are using badges, add them here.

## Index

- [ShouldIBuildThat.io (SIBT.IO)](#shouldibuildthatio-sibtio)
  - [Index](#index)
  - [About](#about)
  - [Usage](#usage)
    - [Installation](#installation)
    - [Commands](#commands)
  - [Development](#development)
    - [Pre-Requisites](#pre-requisites)
    - [Development Environment](#development-environment)
    - [File Structure](#file-structure)
    - [Build](#build)
    - [Deployment](#deployment)
  - [Community](#community)
    - [Contribution](#contribution)
    - [Branches](#branches)
    - [Guideline](#guideline)
  - [FAQ](#faq)
  - [Resources](#resources)
  - [Gallery](#gallery)
  - [Credit/Acknowledgment](#creditacknowledgment)
  - [License](#license)
  - [Uberauth Setup](#uberauth-setup)
    - [Facebook](#facebook)
    - [Github](#github)

## About
Add a detailed introduction about the project here, everything you want the reader to know.

## Usage
Write about how to use this project.

### Installation
- Steps on how to install this project, to use it.
- Be very detailed here, For example, if you have tools which run on different operating systems, write installation steps for all of them.

```
$ add installations steps if you have to.
```

### Commands
- Commands to start the project.

## Development
If you want other people to contribute to this project, this is the section, make sure you always add this.

### Pre-Requisites
List all the pre-requisites the system needs to develop this project.
- A tool
- B tool

### Development Environment
Write about setting up the working environment for your project.
- How to download the project...
- How to install dependencies...


### File Structure
Add a file structure here with the basic details about files, below is an example.

| No | File Name | Details 
|----|------------|-------|
| 1  | index | Entry point

### Build
Write the build Instruction here.

### Deployment
Write the deployment instruction here.

## Community

If it's open-source, talk about the community here, ask social media links and other links.

### Contribution

 Your contributions are always welcome and appreciated. Following are the things you can do to contribute to this project.

 1. **Report a bug** <br>
 If you think you have encountered a bug, and I should know about it, feel free to report it [here]() and I will take care of it.

 2. **Request a feature** <br>
 You can also request for a feature [here](), and if it will viable, it will be picked for development.  

 3. **Create a pull request** <br>
 It can't get better then this, your pull request will be appreciated by the community. You can get started by picking up any open issues from [here]() and make a pull request.

 > If you are new to open-source, make sure to check read more about it [here](https://www.digitalocean.com/community/tutorial_series/an-introduction-to-open-source) and learn more about creating a pull request [here](https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github).


### Branches

 I use an agile continuous integration methodology, so the version is frequently updated and development is really fast.

1. **`stage`** is the development branch.

2. **`master`** is the production branch.

3. No other permanent branches should be created in the main repository, you can create feature branches but they should get merged with the master.

**Steps to work with feature branch**

1. To start working on a new feature, create a new branch prefixed with `feat` and followed by feature name. (ie. `feat-FEATURE-NAME`)
2. Once you are done with your changes, you can raise PR.

**Steps to create a pull request**

1. Make a PR to `stage` branch.
2. Comply with the best practices and guidelines e.g. where the PR concerns visual elements it should have an image showing the effect.
3. It must pass all continuous integration checks and get positive reviews.

After this, changes will be merged.


### Guideline
coding guidelines or other things you want people to follow should follow.


## FAQ
You can optionally add a FAQ section about the project.

##  Resources
Add important resources here

##  Gallery
Pictures of your project.

## Credit/Acknowledgment
Credit the authors here.

##  License
Add a license here, or a link to it.

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
