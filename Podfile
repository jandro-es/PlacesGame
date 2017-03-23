platform :ios, '9.0'

target 'PlacesGame' do
  use_frameworks!

  pod 'Firebase'
  pod 'Fabric'
  pod 'Crashlytics'
  pod 'SwiftLint'
  pod 'GooglePlaces'
  pod 'GooglePlacePicker'
  pod 'GoogleMaps'
  pod 'PermissionScope'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end

end
