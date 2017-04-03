Pod::Spec.new do |s|
s.name         = 'SwiftExtensions'
s.version      = '0.1'
s.summary      = 'SwiftExtensions is a collection of helpful extensions.'
s.description  = 'Collection contains ViewController, UIView, UILabel, ScrollView, MutableData, Dispatch, DeviceType and Realm extensions.'
s.homepage     = 'https://github.com/stfalcon-studio/SwiftExtensions'
s.license      = 'MIT'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author             = { "Viktor Amelin" => "viktor.amelin@stfalcon.com" }

s.platform     = :ios, '9.0'
s.ios.deployment_target = '9.0'

s.requires_arc = true
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
s.source       = { :git => 'https://github.com/stfalcon-studio/SwiftExtensions.git', :tag => s.version.to_s }
s.source_files  = '*.{swift}'

s.dependency 'RealmSwift'

end
