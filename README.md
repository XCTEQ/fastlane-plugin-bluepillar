# bluepillar plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-bluepillar)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin to run XCUI Tests in parallel using Linkedin's Bluepill tool. To get started with `fastlane-plugin-bluepillar`, add it to your project by running:



```bash
fastlane add_plugin bluepillar
```


### Pre-requisite

[Bluepill](https://github.com/linkedin/bluepill) homebrew package doesn't work well as it's lacking `bp` binary.
We have to manually download `bluepill` and `bp` binaries from the Bluepill releases page on [Github](https://github.com/linkedin/bluepill/releases) and put in PATH. This plugin expect it inside `/usr/local/bin/` where all the other binaries live, so that we have `/usr/local/bin/bluepill` and `/usr/local/bin/bp` binaries in place.

### Fastlane Setup

We can setup Fastlane using some BluePill optins and Derived data.  

 ##### BluePill Options

 There are so many options available for the Bluepill but we just need few of them to get going and keep other options as default. This plugin provides basic 7 options as follows

* `app` : PATH to your application. This is usually in the derived data `/Products/Debug-iphonesimulator/YOUR_APP.app`   

* `runner_app_path` : PATH to UI Test runner app. This is usually in derived data `/Products/Debug-iphonesimulator\YOUR_UITEST_SCHEME-Runner.app` If you have a space in the Scheme name then you have to amend it with backslash in your path.

* `scheme_path` : This is path to your scheme. This is usually in the `YOUR_PROJECT.xcodeproj/xcshareddata/xcschemes/YOUR_SCHEME.xcscheme`

* `output_dir` : This is a directory where Bluepill will generate reports.

* `num_sims` : Number of simulators to be launched.

* `runtime` : The iOS version we want to run test against. Note we have to pass it as nested string like this `'"iOS 10.3"'`

* `device`: The simulator to be used. We have to pass it as `'iPad Air'` or `'iPhone 6'`

##### Generate Derived Data for Bluepill

 It's good idea to generate derived data in the project itself using `build for testing` option.
You can do that using Fastlane `scan` like this

```
scan(
    scheme: YOUR_SCHEME,
    build_for_testing: true,
    derived_data_path: "./bluepill",
    buildlog_path: "./bluepill/logs/"
  )
```
This will generate derived data inside `bluepill` directory.

##### Configure Fastfile
Now that, all the Bluepill options are in place and we have generated derived data, we can configure lane in our `Fastfile` like this:

```

lane :test do
  bluepillar(
    app: "bluepill/Bluepillar-ekhnxpeagzjvbabmoghlgxagbgna/Build/Products/Debug-iphonesimulator/Bluepillar.app",
    runner_app_path: "bluepill/Bluepillar-ekhnxpeagzjvbabmoghlgxagbgna/Build/Products/Debug-iphonesimulator/BluepillarUITests-Runner.app",
    scheme_path: "Bluepillar.xcodeproj/xcshareddata/xcschemes/Bluepillar.xcscheme",

    output_dir: "bluepill_output/",
    num_sims: "3",
    runtime: '"iOS 10.3"',
    device: 'iPad\ Air'
  )
end

```
Now that we can run test using fastlane like this :

           $ fastlane test



## About bluepillar

Run XCUITests in Parallel using Bluepill. [Bluepill](https://github.com/linkedin/bluepill) is a tool from LinkedIn to run XCUI tests in the parallel.


## Example

There is sample example project available on Github [Bluepillar-Demo](https://github.com/Shashikant86/Bluepillar-Demo). Just clone it, replace the path to derived data and run


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
