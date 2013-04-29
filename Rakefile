# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project'
require 'rubygems'
require 'motion-cocoapods'

gem 'bubble-wrap'
gem 'sugarcube'
gem 'routable'

Motion::Project::App.setup do |app|

  app.name = 'affair'
  app.device_family = :ipad
  app.interface_orientations = [:landscape_left, :landscape_right]
  app.info_plist['UIStatusBarHidden'] = true

  app.pods do
    pod 'Colours'
  end

end
