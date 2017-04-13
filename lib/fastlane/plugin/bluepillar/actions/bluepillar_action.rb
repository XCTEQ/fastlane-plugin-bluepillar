module Fastlane
  module Actions
    class BluepillarAction < Action
      def self.run(params)
        UI.message("Starting XCTests using the bluepillar fastlane plugin!")
        binary_path = params[:bluepill_binary_path]
        ios_app_path = params[:app_path]
        test_runner_app_path = params[:runner_app_path]
        scheme_path = params[:xctest_scheme_path]
        number_of_simulator = params[:simulators]
        report_path = params[:bluepill_report_path]
        ios_version = params[:bluepill_ios_version]
        command = [
          binary_path,
          '-a',
          ios_app_path,
          '-u',
          test_runner_app_path,
          '-s',
          scheme_path,
          '-o',
          report_path,
          '-r',
          ios_version,
          '-n',
          number_of_simulator,
          # '-t',
          # xctest_path,
          # '-d',
          # ios_device,
        ]
        Actions.sh(command.join(' '))
      end

      def self.description
        "Run XCUITests in Parallel using Bluepill"
      end

      def self.authors
        ["Shashikant86"]
      end

      def self.return_value

      end

      def self.details
        "This plugin will allow you to run XCUITests in Parallel using LinkedIn's Bluepil"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :bluepill_binary_path,
                                      env_name: "BLUEPILLAR_BINARY_PATH",
                                      description: "Path to bluepill and bp binary which can be downloaded from Github. Hack till homebrew install WIP ",
                                      is_string: true,
                                      optional: false),

           FastlaneCore::ConfigItem.new(key: :app_path,
                                       env_name: "BLUEPILLAR_APP_PATH",
                                       description: "Path to the main app to be build for the bluepill in the Derived Data",
                                       is_string: true,
                                       optional: false),

           FastlaneCore::ConfigItem.new(key: :runner_app_path,
                                      env_name: "BLUEPILLAR_RUNNER_APP_PATH",
                                      description: "Path to the test runner app in the Derived Data",
                                      is_string: true,
                                      optional: false),

           FastlaneCore::ConfigItem.new(key: :xctest_scheme_path,
                                     env_name: "BLUEPILLAR_XCTEST_SCHEME_PATH",
                                     description: "Path to the scheme to be build for the bluepill in the .xcodeproj",
                                     is_string: true,
                                     optional: false),

           FastlaneCore::ConfigItem.new(key: :bluepill_report_path,
                                    env_name: "BLUEPILLAR_REPORT_PATH",
                                    description: "Path to store simulator logs and test reports",
                                    is_string: true,
                                    optional: false),

           FastlaneCore::ConfigItem.new(key: :simulators,
                                    env_name: "BLUEPILLAR_SUMULATORS",
                                    description: "Number of sumulators to be launched",
                                    is_string: true,
                                    optional: true),

           FastlaneCore::ConfigItem.new(key: :bluepill_ios_version,
                                   env_name: "BLUEPILLAR_IOS_VERSION",
                                   description: "The iOS version to be used for testing",
                                   is_string: true,
                                   optional: true),
        ]
      end

      def self.example_code
        ['bluepillar(
                app_path: "/Users/shashi/Library/Developer/Xcode/DerivedData/Bluepillar-ekhnxpeagzjvbabmoghlgxagbgna/Build/Products/Debug-iphonesimulator/Bluepillar.app",
                runner_app_path: "/Users/shashi/Library/Developer/Xcode/DerivedData/Bluepillar-ekhnxpeagzjvbabmoghlgxagbgna/Build/Products/Debug-iphonesimulator/BluepillarUITests-Runner.app",
                xctest_scheme_path: "Bluepillar.xcodeproj/xcshareddata/xcschemes/Bluepillar.xcscheme",
                bluepill_binary_path: "bin/bluepill",
                bluepill_report_path: "bluepill_output/",
                simulators: "3",
                bluepill_ios_version: '"iOS 10.3"'
              )
          ']
    end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
        true
      end
    end
  end
end
