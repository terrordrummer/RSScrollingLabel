#
# Be sure to run `pod lib lint RSScrollingLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RSScrollingLabel'
  s.version          = '0.1.0'
  s.summary          = 'A simple UILabel-like view with text animations.'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = "A simple UILabel-like view with text animations. Simply use it an UILabel and invoke animate(to:, direction:) to trigger a text animation."

  s.homepage         = 'https://github.com/terrordrummer/RSScrollingLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'terrordrummer' => 'roberto.sartori@gmail.com' }
  s.source           = { :git => 'https://github.com/terrordrummer/RSScrollingLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RSScrollingLabel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RSScrollingLabel' => ['RSScrollingLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
