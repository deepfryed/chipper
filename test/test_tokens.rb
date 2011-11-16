require 'helper'

describe 'Chipper tokens' do
  before do
    @tweet = "@youtube, why is that stories abt @apple on #cnn always get #removed from http://www1.youtube.com/videos/?"
  end

  after do
    Chipper.skip_tokens    nil
  end

  it 'should extract tokens' do
    expect = [%w(why that stories abt always get from)]
    Chipper.tokens(@tweet).must_equal expect
  end

  it 'should skip tokens' do
    expect = [%w(why that abt get)]
    Chipper.skip_tokens(%w(story always from video))
    Chipper.tokens(@tweet).must_equal expect
  end
end
