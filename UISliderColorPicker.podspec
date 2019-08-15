#
# Be sure to run `pod lib lint UISliderColorPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UISliderColorPicker'
  s.version          = '0.1.0'
  s.swift_version    = '5'
  s.summary          = 'UISlider Color Picker.'


  s.description      = <<-DESC
  'Open source project in order for Color Picker.'.
  DESC

  s.homepage         = 'https://github.com/farisalbalawi/UISliderColorPicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Faris Albalawi' => 'developer.faris@gmail.com' }
  s.source           = { :git => 'https://github.com/farisalbalawi/UISliderColorPicker.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  
  s.source_files = 'UISliderColorPicker/Classes/*.swift'
   s.resource_bundles = {
     'UISliderColorPicker' => ['UISliderColorPicker/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
