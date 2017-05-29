module Fastlane
  module Actions
    class BluepillarAction < Action
      BLUEPILL_PATH = '/usr/local/bin/bluepill'
      BP_PATH = '/usr/local/bin/bp'
      def self.run(params)
        UI.message("Starting XCTests using the bluepillar fastlane plugin!")
        unless File.exist?(BLUEPILL_PATH)
          UI.user_error!("You must download bluepill binary from Github and put it in /usr/local/bin/bluepill to carry on execution")
        end

        unless File.exist?(BP_PATH)
          UI.user_error!("You must download bp binary from Github and put it in /usr/local/bin/bp to carry on execution")
        end

        bluepill_app_path = params[:app]
        bluepill_runner_app_path = params[:runner_app_path]
        bluepill_scheme_path = params[:scheme_path]
        bluepill_num_sims = params[:num_sims]
        bluepill_output_dir = params[:output_dir]
        bluepill_runtime = params[:runtime]
        bluepill_device = params[:device]
        processed_device = bluepill_device.gsub(/ /, '\ ')


        command = [
          'bluepill',
          '-a',
          bluepill_app_path,
          '-s',
          bluepill_scheme_path,
          '-o',
          bluepill_output_dir,
          '-r',
          bluepill_runtime,
          '-n',
          bluepill_num_sims,
          '-d',
          processed_device,
        ]

        command.concat ['-u', bluepill_runner_app_path] if bluepill_runner_app_path

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
           FastlaneCore::ConfigItem.new(key: :app,
                                       env_name: "BLUEPILLAR_APP_PATH",
                                       description: "Path to the main app to be build for the bluepill in the Derived Data",
                                       is_string: true,
                                       optional: false),

           FastlaneCore::ConfigItem.new(key: :runner_app_path,
                                      env_name: "BLUEPILLAR_RUNNER_APP_PATH",
                                      description: "Path to the test runner app in the Derived Data",
                                      is_string: true,
                                      optional: true),

           FastlaneCore::ConfigItem.new(key: :scheme_path,
                                     env_name: "BLUEPILLAR_XCTEST_SCHEME_PATH",
                                     description: "Path to the scheme to be build for the bluepill in the .xcodeproj",
                                     is_string: true,
                                     optional: false),

           FastlaneCore::ConfigItem.new(key: :output_dir,
                                    env_name: "BLUEPILLAR_REPORT_PATH",
                                    description: "Path to store simulator logs and test reports",
                                    is_string: true,
                                    optional: false),

           FastlaneCore::ConfigItem.new(key: :num_sims,
                                    env_name: "BLUEPILLAR_SUMULATORS",
                                    description: "Number of sumulators to be launched",
                                    default_value: "3",
                                    is_string: true,
                                    optional: true),

           FastlaneCore::ConfigItem.new(key: :runtime,
                                   env_name: "BLUEPILLAR_IOS_VERSION",
                                   description: "The iOS version to be used for testing",
                                   default_value: '"iOS 10.3"',
                                   is_string: true,
                                   optional: true),

           FastlaneCore::ConfigItem.new(key: :device,
                                   env_name: "BLUEPILLAR_IOS_DEVICE",
                                   description: "The iOS device to be used for testing",
                                   default_value: "'iPhone 6'",
                                   is_string: true,
                                   optional: true),
        ]
      end

      def self.example_code
           ['   bluepillar(
                    app: "bluepill/Build/Products/Debug-iphonesimulator/Bluepillar.app",
                    runner_app_path: "bluepill/Build/Products/Debug-iphonesimulator/BluepillarUITests-Runner.app",
                    scheme_path: "Bluepillar.xcodeproj/xcshareddata/xcschemes/Bluepillar.xcscheme",
                    output_dir: "bluepill_output/",
                    num_sims: "3",
                    runtime: '"iOS 10.3"',
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
