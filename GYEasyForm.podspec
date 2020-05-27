#
# Be sure to run `pod lib lint GYEasyForm.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GYEasyForm'
  s.version          = '0.1.2'
  s.summary          = 'A mobile framework that is very easy to build forms.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A mobile framework that is very easy to build forms. ✍️✍️✍️
                       DESC

  s.homepage         = 'https://github.com/gaoyuexit/GYEasyForm'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gaoyu' => 'gaoyuexit@gmail.com' }
  s.source           = { :git => 'https://github.com/gaoyuexit/GYEasyForm.git', :tag => s.version.to_s }
  s.social_media_url   = "https://github.com/gaoyuexit/GYEasyForm"

  s.subspec 'Core' do |sp|
      sp.source_files = ['GYEasyForm/Classes/Core/*.{h,m}']
  end
  
  s.subspec 'Rows' do |sp|
      sp.source_files = ['GYEasyForm/Classes/Rows/*.{h,m}']
      sp.dependency 'GYEasyForm/Core'
      sp.resource_bundles = {
          'Rows' => ['GYEasyForm/Assets/Rows/*']
      }
  end
  
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.default_subspec = 'Core'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
