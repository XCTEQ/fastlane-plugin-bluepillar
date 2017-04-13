# bluepillar plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-bluepillar)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-bluepillar`, add it to your project by running:



```bash
fastlane add_plugin bluepillar
```
Now, we have to manually d


### Pre-requisite

[Bluepill](https://github.com/linkedin/bluepill) homebrew package doesn't work well as it's lacking `bp` binary, so we have to manually download `bluepill` and `bp` binaries somewhere in your app. This is limitation till homebrew install works properly.  

Then in your `Fastfile` set some bluepill options. Your example lane will look like this. It's good idea to generate derived data in the project itself using `build for testing` option. 
You can do that using Fastlane `scan` like this 

```
scan(
    scheme: your_bluepill_scheme,
    build_for_testing: true,
    derived_data_path: "./bluepill",
    buildlog_path: "./bluepill/logs/"
  )
```
This will geberate derived data inside `bluepill` directory. 



```

lane :test do
  bluepillar(
    app_path: "/path_to_the/DerivedData/Bluepillar-ekhnxpeagzjvbabmoghlgxagbgna/Build/Products/Debug-iphonesimulator/Bluepillar.app",
    runner_app_path: "/path_to_the/DerivedData/Bluepillar-ekhnxpeagzjvbabmoghlgxagbgna/Build/Products/Debug-iphonesimulator/BluepillarUITests-Runner.app",
    xctest_scheme_path: "Bluepillar.xcodeproj/xcshareddata/xcschemes/Bluepillar.xcscheme",
    bluepill_binary_path: "bin/bluepill",
    bluepill_report_path: "bluepill_output/",
    simulators: "3",
    bluepill_ios_version: '"iOS 10.3"'
  )
end

```


## About bluepillar

Run XCUITests in Parallel using Bluepill. [Bluepill](https://github.com/linkedin/bluepill) is a tool from LinkedIn to run XCUI tests in the parallel.


## Example

There is sample example project available on Github [Bluepillar-Demo](https://github.com/Shashikant86/Bluepillar-Demo). Just clone it run

           $ git clone git@github.com:Shashikant86/Bluepillar-Demo.git
           $ bundle install
           $ bundle exec fastlane test

You can see sample report in the  `sample_bluepill_output` directory.



## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).
