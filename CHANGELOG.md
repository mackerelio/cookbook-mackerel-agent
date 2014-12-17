mackerel-agent Cookbook CHANGELOG
=================================
This file is used to list changes made in each version of the mackerel-agent cookbook.

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
