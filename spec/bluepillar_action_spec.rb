describe Fastlane::Actions::BluepillarAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("Starting XCTests using the bluepillar fastlane plugin!")

      Fastlane::Actions::BluepillarAction.run(nil)
    end
  end
end
