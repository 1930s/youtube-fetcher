require 'rails_helper'

RSpec.describe "channels/show", type: :view do
  subject { rendered }
  let(:podcast) { FactoryGirl.build(:podcast, title: 'My Podcast') }
  before do
    assign(:podcast, podcast)
    assign(:videos, [FactoryGirl.build(:episode, title: 'My Episode')])

    render
  end

  it { is_expected.to include 'My Podcast' }
  it { is_expected.to include 'My Episode' }
  it { is_expected.to include 'Audio podcast' }
  it { is_expected.to include 'Video podcast' }

  it { is_expected.to include channel_url(podcast.origin_id, format: :atom) }

  context 'when playlist' do
    let(:podcast) { FactoryGirl.build(:podcast, :playlist) }

    it { is_expected.to include playlist_url(podcast.origin_id, format: :atom) }
  end
end
