#
# Cookbook Name:: travis_ci_minimal
# Recipe:: default
#
# Copyright 2015, Travis CI GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

execute 'apt-get update -yqq'

include_recipe 'travis_build_environment'
include_recipe 'apt'

package Array(node['travis_build_environment']['packages']) do
  action [:install, :upgrade]
end

include_recipe 'clang::tarball'
include_recipe 'sysctl'
include_recipe 'git::ppa'
include_recipe 'jq'
include_recipe 'docker'
include_recipe 'libevent'
include_recipe 'gimme'
include_recipe 'java::multi'
include_recipe 'nodejs::multi'
include_recipe 'php::multi'
include_recipe 'perlbrew::multi'
include_recipe 'python::pyenv'
include_recipe 'rvm'
include_recipe 'rvm::multi'
include_recipe 'system_info'
include_recipe 'sweeper'
