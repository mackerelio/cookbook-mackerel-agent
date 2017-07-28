How to release new version
==========================

1. Update CHANGELOG.md
1. Upgrade version of metadata.rb
1. `git commit -m "Bump version x.x.x"`
1. `git tag vx.x.x`
1. `git push origin master && git push --tags`
1. `bundle exec berks --no-git --key /path/to/pem`. See https://supermarket.chef.io/cookbooks/mackerel-agent
