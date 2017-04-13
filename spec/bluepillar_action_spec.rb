describe Fastlane::Actions::BluepillarAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The bluepillar plugin is working!")

      Fastlane::Actions::BluepillarAction.run(nil)
    end
  end
end
