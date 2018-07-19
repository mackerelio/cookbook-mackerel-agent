mackerel-agent Cookbook CHANGELOG
=================================
This file is used to list changes made in each version of the mackerel-agent cookbook.

v3.1.0
------
Chef >= 14.3.36 is necessary for Amazon Linux 2 GA.

- Fix around AmazonLinux 2 [#41](https://github.com/mackerelio/cookbook-mackerel-agent/pull/41) ([astj](https://github.com/astj))
- Add tests for Ubuntu 18.04 [#39](https://github.com/mackerelio/cookbook-mackerel-agent/pull/39) ([hayajo](https://github.com/hayajo))
- New URL for GPG-KEY-mackerel [#38](https://github.com/mackerelio/cookbook-mackerel-agent/pull/38) ([astj](https://github.com/astj))

v3.0.0
------
Chef 11.0~12.4 and/or Ruby 1.9.x are no more supported.

- Support Amazon Linux 2 [#37](https://github.com/mackerelio/cookbook-mackerel-agent/pull/37) ([hayajo](https://github.com/hayajo))
- Remove yum cookbook version constraint (Drop Chef < 12.5 / Ruby 1.9 support) [#35](https://github.com/mackerelio/cookbook-mackerel-agent/pull/35) ([nonylene](https://github.com/nonylene))
- Lazily evaluate variables passed to env file template [#34](https://github.com/mackerelio/cookbook-mackerel-agent/pull/34) ([astj](https://github.com/astj))

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
