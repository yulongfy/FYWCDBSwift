# pod lib lint --verbose --allow-warnings FYWCDBSwift.podspec
# pod trunk push --verbose --allow-warnings FYWCDBSwift.podspec
Pod::Spec.new do |wcdb|
  wcdb.name         = "FYWCDBSwift"
  wcdb.version      = "0.0.1"
  wcdb.summary      = "This is the copy of WCDB, which is a cross-platform database framework developed by WeChat."
  wcdb.description  = <<-DESC
                      The WeChat Database, for Swift. (If you want to use WCDB for Objective-C, see the "WCDB" pod.)

                      WCDB is an efficient, complete, easy-to-use mobile database framework used in the WeChat application.
                      It can be a replacement for Core Data, SQLite & FMDB.
                      DESC
  wcdb.homepage     = "https://github.com/yulongfy/FYWCDBSwift.git"
  wcdb.license      = { :type => "BSD", :file => "LICENSE" }
  wcdb.author             = { "yulongfy" => "yulong@foryou56.com" }
  wcdb.ios.deployment_target = "9.0"
  wcdb.source       = { :git => "https://github.com/yulongfy/FYWCDBSwift.git", :tag => wcdb.version }
  wcdb.source_files  = "FYWCDBSwift/source/**/*.swift", "FYWCDBSwift/source/**/**/*.swift", "FYWCDBSwift/source/util/*.{h,c}"
  wcdb.module_name = "WCDBSwift"
  wcdb.requires_arc = true
  wcdb.pod_target_xcconfig = { 
    "GCC_PREPROCESSOR_DEFINITIONS" => "SQLITE_HAS_CODEC WCDB_BUILTIN_SQLCIPHER",
    'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
    'APPLICATION_EXTENSION_API_ONLY' => 'YES',
    "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/WCDBSwift",
    "LIBRARY_SEARCH_PATHS[sdk=macosx*]" => "$(SDKROOT)/usr/lib/system",
    # "OTHER_SWIFT_FLAGS[config=Release][sdk=iphonesimulator*]" => "-D WCDB_IOS",
    # "OTHER_SWIFT_FLAGS[config=Release][sdk=iphoneos*]" => "-D WCDB_IOS",
    # "OTHER_SWIFT_FLAGS[config=Debug]" => "-D DEBUG",
    # "OTHER_SWIFT_FLAGS[config=Debug][sdk=iphonesimulator*]" => "-D WCDB_IOS -D DEBUG",
    # "OTHER_SWIFT_FLAGS[config=Debug][sdk=iphoneos*]" => "-D WCDB_IOS -D DEBUG",
  }
  wcdb.swift_version = '5.0'
  wcdb.dependency 'OptimizedSQLCipher'
  wcdb.dependency 'SQLiteRepair'
end