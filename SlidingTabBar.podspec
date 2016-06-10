
Pod::Spec.new do |s|
s.name             = "SlidingTabBar"
s.version          = "0.2.1"
s.summary          = "SlidingTabBar is custom tabBar view with sliding animation for tabBar item selection."
s.homepage         = "https://github.com/bardonadam/SlidingTabBar"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = { :type => "MIT", :file => "LICENSE" }
s.author           = { "Adam Bardon" => "bardon.adam@gmail.com" }
s.source           = { :git => "https://github.com/bardonadam/SlidingTabBar.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/bardonadam'

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
s.frameworks = 'UIKit'
end
