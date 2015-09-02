Pod::Spec.new do |s|  
  s.name             = "CLHtmlTable" 
  s.version          = "1.0.0"  
  s.summary          = "A marquee view used on iOS."  
  s.description  = <<-DESC
                   A longer description of CLHtmlTable in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC
  s.homepage         = "https://github.com/mclkyo/CLHtmlTable"  
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"  
  s.license          = "MIT"  
  s.author           = { "mclkyo" => "codesourse@gmail.com" }  
  s.source           = { :git => "https://github.com/mclkyo/CLHtmlTable.git", :tag => "1.0.0"}  
  # s.social_media_url = 'https://twitter.com/NAME'  
  s.platform     = :ios, "4.3"  
  # s.ios.deployment_target = '5.1'  
  # s.osx.deployment_target = '10.7'  
  s.requires_arc = true  
  s.source_files = "Libs/**/*.{h,m}"
  # s.resources = 'Assets'  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.h'  
  # s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'     

end