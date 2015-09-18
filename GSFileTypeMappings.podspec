Pod::Spec.new do |s|
  s.name         = 'GSFileTypeMappings'
  s.version      = '2.0.0'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSFileTypeMappings'
  s.source       = { :git => 'https://github.com/GyazSquare/GSFileTypeMappings.git', :tag => '2.0.0' }
  s.summary      = 'A simple file type mapping library for iOS and OS X.'
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.6'
  s.watchos.deployment_target = '2.0'
  s.dependency 'GSSynthesizeSingleton'
  s.requires_arc  = true
  s.ios.framework = 'MobileCoreServices'
  s.source_files  = 'GSFileTypeMappings/*.{h,m}'
end
