# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project'
require 'rubygems'
require 'bundler'
Bundler.require

require 'sugarcube-gestures'

Motion::Project::App.setup do |app|

  app.name = 'affair'
  app.device_family = :ipad
  app.interface_orientations = [:landscape_left, :landscape_right]
  app.info_plist['UIStatusBarHidden'] = true

  app.pods do
    pod 'Colours'
  end

end
