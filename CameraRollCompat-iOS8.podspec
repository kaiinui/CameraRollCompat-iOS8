Pod::Spec.new do |s|
  s.name         = "CameraRollCompat-iOS8"
  s.version      = "0.1.0"
  s.summary      = "Bringing Camera Roll to iOS8, where Camera Roll had been thrown away by Apple in iOS8 :/"
  s.homepage     = "https://github.com/kaiinui/CameraRollCompat-iOS8"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/CameraRollCompat-iOS8.git", :tag => "v0.3.0" }
  s.source_files  = "CameraRollCompat/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end
