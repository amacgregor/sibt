# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](Https://conventionalcommits.org) for commit guidelines.

<!-- changelog -->

## [0.8.1](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.8.0...0.8.1) (2019-7-31)




### Bug Fixes:

* ignore unused variable

## [0.8.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.7.0...0.8.0) (2019-7-31)




### Improvements:

* ignore refactor checks from pipeline

### Features:

* use project code instead of ids

* add additional plugs for view tracking

* add ability to get project by code and auto increment view count

### Bug Fixes:

* documentation for Plug module

### Improvements:

* cleanup for mix format

* change get_project! for credo feedback

* fix the test to account for the new show template

* index action according to credo

* project list according to credo

### Improvements:

* fix layout for project view

* update layout for project detail view

### Improvements:

* add feature definition in Gherkin

## [0.7.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.6.0...0.7.0) (2019-7-29)




### Features:

* autogenerate the project_id / slug

* add inline wyswyg editor

* add summaries for the projects

### Bug Fixes:

* change description to a long text field

* project card should render summary

* allow template to render html for description

### Improvements:

* update the template for project view

## [0.6.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.5.0...0.6.0) (2019-7-29)




### Features:

* refactor session controller to use accounts context

* add accounts context with matching tests

* monitoring: add support for sentry.io

### Improvements:

* only show projects for current user

* list projects by user id

* sentry handling auth provider errors

## [0.5.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.4.2...0.5.0) (2019-7-28)




### Features:

* update depencies for project

### Bug Fixes:

* logo is now clickable

### Improvements:

* warning: remove unused import from SetUser Plug

## [0.4.2](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.4.1...0.4.2) (2019-2-3)




### Bug Fixes:

* previously broken tests

* frontend: minor display bugs on the project list

### Improvements:

* add username to the project cards

## [0.4.1](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.4.0...0.4.1) (2019-2-3)




### Bug Fixes:

* update the gitops configuration

### Improvements:

* clean up the seeds file according to mix format

## [0.4.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.3.2...0.4.0) (2019-2-3)




### Features:

* layout: change project display to grid

## [0.3.2](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.3.1...0.3.2) (2019-2-3)




### Bug Fixes:

* remove IO.inspect call

* update the project creation form and schema

## [0.3.1](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.3.0...0.3.1) (2019-2-3)




### Bug Fixes:

* project and add project links now work

## [0.3.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.2.0...0.3.0) (2019-2-3)




### Features:

* versioning: move application version to variable

## [0.2.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.1.1...0.2.0) (2019-2-3)




### Features:

* changelog: add the changelog to the release

## [0.1.0](https://gitlab.com/amacgregor/shouldibuildthat/compare/0.1.0...0.1.0) (2019-2-3)




### Features:

* add operation context and project module

* login: add the ability to signout and keep the user in session

* working facebook login

* layout: added main navigation
