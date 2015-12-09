# stash_core_api

* [Homepage](https://rubygems.org/gems/stash_core_api)
* [Documentation](http://rubydoc.info/gems/stash_core_api/frames)
* [Email](mailto:arp at squareup.com)

## Description

Make basic auth requests to Stash Core REST API.

## Features

* Provides client to make requests to Stash

## Examples

    require 'stash_core_api'

###  Using client to get commit and pull request info

    require 'stash_core_api'
    stash_client = StashCoreAPI::Client.new(
      user: user,
      pass: pass,
      project: project,
      repository: stash_repo,
      stash_url: stash_url,
    )

    # commits
    stash_client.commits(since: sha1, until_: sha2)

    # pull requests
    stash_client.info(pull_request_id)
    stash_client.can_merge?(pull_request_id)

## Implementing More Endpoints

This gem only implements a few of the many ones that Stash Core REST API offers, which can be seen [here](https://developer.atlassian.com/static/rest/stash/3.11.3/stash-rest.html).

Note: filenames in this gem are pulled from the following pattern:  `rest/api/1.0/projects/{projectKey}/repos/{respositorySlug}/<file-name>`, which corresponds to the file `lib/stash_core_api/file_name.rb` in this gem.

### Add method to an existing endpoint

Implementing [watch pull requests](https://developer.atlassian.com/static/rest/stash/3.11.3/stash-rest.html#idp186608):

1. Implement method `watch` in `lib/stash_core_api/pull_requests.rb`

Using the stash client above, you can now call this method:

    stash_client.watch(pull_request_id)

### Add new endpoint


Implementing [branches](https://developer.atlassian.com/static/rest/stash/3.11.3/stash-rest.html#idp959232):

1. Create file `lib/stash_core_api/branches.rb`
2. Implement method `branches` in `lib/stash_core_api/pull_requests.rb`
3. Include `StashCoreAPI::Branches` in `lib/stash_core_api/api.rb`

Using the stash client above, you can now call this method:

    stash_client.branches

## Install

    $ gem install stash_core_api

## License

    Copyright 2015 Square, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
