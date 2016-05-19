mackerel-agent Cookbook CHANGELOG
=================================
This file is used to list changes made in each version of the mackerel-agent cookbook.

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
