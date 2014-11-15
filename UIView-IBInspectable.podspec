Pod::Spec.new do |s|
  s.name             = "UIView-IBInspectable"
  s.version          = "1.0.0"
  s.summary          = "Small swift extension to allow CALayer properties to be changed in Interface Builder."
  s.homepage         = "https://github.com/rhodgkins/UIView-IBInspectable"
  s.license          = 'MIT'
  s.author           = { "Rich Hodgkins" => "rhodgkins@gmail.com" }
  s.source           = { :git => "https://github.com/rhodgkins/UIView-IBInspectable.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rhodgkins'

  s.platform         = :ios, '7.0'

  s.source_files     = 'Source/*'
end
