# Uncomment the next line to define a global platform for your project
# platform :iOS, '9.0'

target 'Atlantica' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
pod 'MBProgressHUD'
pod 'Toast-Swift'
pod 'SkyFloatingLabelTextField', '~> 3.0'
# Workaround for Cocoapods issue #7606
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end


  # Pods for Atlantica

end
