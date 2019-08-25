# ShouldIBuildThat.io (SIBT.IO)
[![pipeline status](https://gitlab.com/bloccsio/shouldibuildthat/badges/master/pipeline.svg)](https://gitlab.com/bloccsio/shouldibuildthat/commits/master)
[![coverage report](https://gitlab.com/bloccsio/shouldibuildthat/badges/master/coverage.svg)](https://gitlab.com/bloccsio/shouldibuildthat/commits/master)

# Introduction
- Add your project logo.
- Write a short introduction to the project.
- If you are using badges, add them here

## :ledger: Index

- [ShouldIBuildThat.io (SIBT.IO)](#shouldibuildthatio-sibtio)
- [Introduction](#introduction)
  - [:ledger: Index](#ledger-index)
  - [:beginner: About](#beginner-about)
  - [:zap: Usage](#zap-usage)
    - [:electric_plug: Installation](#electricplug-installation)
    - [:package: Commands](#package-commands)
  - [:wrench: Development](#wrench-development)
    - [:notebook: Pre-Requisites](#notebook-pre-requisites)
    - [:nut_and_bolt: Development Environment](#nutandbolt-development-environment)
    - [:file_folder: File Structure](#filefolder-file-structure)
    - [:hammer: Build](#hammer-build)
    - [:rocket: Deployment](#rocket-deployment)
  - [:cherry_blossom: Community](#cherryblossom-community)
    - [:exclamation: Guideline](#exclamation-guideline)
  - [:question: FAQ](#question-faq)
  - [:page_facing_up: Resources](#pagefacingup-resources)
  - [:camera: Gallery](#camera-gallery)
  - [:star2: Credit/Acknowledgment](#star2-creditacknowledgment)
  - [:lock: License](#lock-license)
  - [Uberauth Setup](#uberauth-setup)
    - [Facebook](#facebook)
    - [Github](#github)

##  :beginner: About
Add a detailed introduction about the project here, everything you want the reader to know.

## :zap: Usage
Write about how to use this project.

###  :electric_plug: Installation
- Steps on how to install this project, to use it.
- Be very detailed here, For example, if you have tools which run on different operating systems, write installation steps for all of them.

```
$ add installations steps if you have to.
```

###  :package: Commands
- Commands to start the project.

##  :wrench: Development
If you want other people to contribute to this project, this is the section, make sure you always add this.

### :notebook: Pre-Requisites
List all the pre-requisites the system needs to develop this project.
- A tool
- B tool

###  :nut_and_bolt: Development Environment
Write about setting up the working environment for your project.
- How to download the project...
- How to install dependencies...


###  :file_folder: File Structure
Add a file structure here with the basic details about files, below is an example.

```
.
├── assets
│   ├── css
│   │   ├── index-ui.css
│   │   └── rate-ui.css
│   ├── images
│   │   ├── icons
│   │   │   ├── shrink-button.png
│   │   │   └── umbrella.png
│   │   ├── logo_144.png
│   │   └── Untitled-1.psd
│   └── javascript
│       ├── index.js
│       └── rate.js
├── CNAME
├── index.html
├── rate.html
└── README.md
```

| No | File Name | Details 
|----|------------|-------|
| 1  | index | Entry point

###  :hammer: Build
Write the build Instruction here.

### :rocket: Deployment
Write the deployment instruction here.

## :cherry_blossom: Community

If it's open-source, talk about the community here, ask social media links and other links.

 ###  :fire: Contribution

 Your contributions are always welcome and appreciated. Following are the things you can do to contribute to this project.

 1. **Report a bug** <br>
 If you think you have encountered a bug, and I should know about it, feel free to report it [here]() and I will take care of it.

 2. **Request a feature** <br>
 You can also request for a feature [here](), and if it will viable, it will be picked for development.  

 3. **Create a pull request** <br>
 It can't get better then this, your pull request will be appreciated by the community. You can get started by picking up any open issues from [here]() and make a pull request.

 > If you are new to open-source, make sure to check read more about it [here](https://www.digitalocean.com/community/tutorial_series/an-introduction-to-open-source) and learn more about creating a pull request [here](https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github).


 ### :cactus: Branches

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


### :exclamation: Guideline
coding guidelines or other things you want people to follow should follow.


## :question: FAQ
You can optionally add a FAQ section about the project.

##  :page_facing_up: Resources
Add important resources here

##  :camera: Gallery
Pictures of your project.

## :star2: Credit/Acknowledgment
Credit the authors here.

##  :lock: License
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
