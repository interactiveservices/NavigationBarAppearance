#
# Be sure to run `pod lib lint NavigationBarAppearance.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NavigationBarAppearance'
  s.version          = '0.5.0'
  s.summary          = 'Easy way to customize navigationbar and barbuttonitem appearance of your viewcontroller or entire applcation in declarative manner'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = <<-DESC

  Stop seraching stackoverflow and just do it in a few lines of code with declarative manner
  You can easily configure NavigationBar:
  - image (globaly and in currentVC)
  - solidColor (globaly and in currentVC)
  - titleAttributes (globaly and in currentVC)
  - customise backbutton image and title
  - barbuttonsTitleAttributes (globaly and in currentVC)
  - remove or set back shadow in on line of code
    DESC

  s.homepage         = 'https://github.com/interactiveservices/NavigationBarAppearance'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nikolay.shubenkov@gmail.com' => 'n.shubenkov@be-interactive.ru' }
  s.source           = { :git => 'https://github.com/interactiveservices/NavigationBarAppearance.git', :tag => 0.5 }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'NavigationBarAppearance/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NavigationBarAppearance' => ['NavigationBarAppearance/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

end
