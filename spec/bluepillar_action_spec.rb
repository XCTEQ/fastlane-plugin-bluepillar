describe Fastlane::Actions::BluepillarAction do
  describe '#run' do
    it 'prints correct description' do
      plugin_description = Fastlane::Actions::BluepillarAction.description
      expect(plugin_description).to include("Run XCUITests in Parallel using Bluepill")
    end
  end
end
