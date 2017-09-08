mackerel-agent Cookbook CHANGELOG
=================================
This file is used to list changes made in each version of the mackerel-agent cookbook.

v2.0.0
------
- append stove dependency to Gemfile and renew Gemfile.lock [#32](https://github.com/mackerelio/cookbook-mackerel-agent/pull/32) ([Songmu](https://github.com/Songmu))
- Support v2 package repository [#29](https://github.com/mackerelio/cookbook-mackerel-agent/pull/29) ([astj](https://github.com/astj))

v1.3.0
------
- Add more platforms' test [#30](https://github.com/mackerelio/cookbook-mackerel-agent/pull/30) ([astj](https://github.com/astj))
- Use TravisCI instead of CircleCI [#28](https://github.com/mackerelio/cookbook-mackerel-agent/pull/28) ([astj](https://github.com/astj))
- update README about default['mackerel-agent']['conf'] [#27](https://github.com/mackerelio/cookbook-mackerel-agent/pull/27) ([astj](https://github.com/astj))
- Support to configure environment variables opts [#25](https://github.com/mackerelio/cookbook-mackerel-agent/pull/25) ([spesnova](https://github.com/spesnova))
- Fixed README.md [#26](https://github.com/mackerelio/cookbook-mackerel-agent/pull/26) ([kakakakakku](https://github.com/kakakakakku))

v1.2.1
------
- Support new mackerel-agent for Amazon Linux #24 (by spesnova)

v1.2.0
------
- Change default mackerel-agent-plugins action into :upgrade.
- Add node['mackerel-agent']['plugins']['package-action'] attribute.
- Set compile_time to chef_gem for future compatibility (by sawanoboly)

v1.1.0
------
- Add installation of `mackerel-agent-plugins` package. (by koudaiii)

v1.0.1
------
- Change action of service[mackerel-agent] from restart to start (by sawanoboly)
- Restart agent when package is newly installed or upgraded
- Add node attribute `start_on_setup`.

v1.0.0
------
- Stable release
