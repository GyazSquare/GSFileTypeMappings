Pod::Spec.new do |s|
  s.name         = 'GSFileTypeMappings'
  s.version      = '3.1.0'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSFileTypeMappings'
  s.source       = { :git => 'https://github.com/GyazSquare/GSFileTypeMappings.git', :tag => 'v3.1.0' }
  s.summary      = 'A simple file type mapping library for iOS, OS X, watchOS and tvOS.'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.6'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.dependency 'GSSynthesizeSingleton'
  s.requires_arc  = true
  s.ios.framework = 'MobileCoreServices'
  s.watchos.framework = 'MobileCoreServices'
  s.source_files  = 'GSFileTypeMappings/*.{h,m}'
end
