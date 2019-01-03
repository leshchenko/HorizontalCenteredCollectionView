#
# Be sure to run `pod lib lint HorizontalCenteredCollectionView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HorizontalCenteredCollectionView'
  s.version          = '1.0'
  s.summary          = 'Simple horizontal collection view with centered items'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Lib which helps create horizontal collection view with centered items.
                       DESC

  s.homepage         = 'https://github.com/leshchenko/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Ruslan Leshchenko' => 'leshchenkoruua@gmail.com' }
  s.source           = { :git => 'https://github.com/leshchenko/HorizontalCenteredCollectionView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'HorizontalCenteredCollectionView/CollectionView/**'

  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
