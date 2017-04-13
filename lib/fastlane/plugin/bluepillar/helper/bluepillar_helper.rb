module Fastlane
  module Helper
    class BluepillarHelper
      # class methods that you define here become available in your action
      # as `Helper::BluepillarHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the bluepillar plugin helper!")
      end
    end
  end
end
