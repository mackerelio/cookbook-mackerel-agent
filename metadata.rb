# frozen_string_literal: true

name             'mackerel-agent'
maintainer       'Hatena Co., Ltd.'
maintainer_email 'mackerel-developers@hatena.ne.jp'
license          'Apache License, Version 2.0'
description      'Installs/Configures mackerel-agent'
long_description File.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '4.1.0'

%w[debian ubuntu redhat centos rocky amazon].each do |os|
  supports os
end
