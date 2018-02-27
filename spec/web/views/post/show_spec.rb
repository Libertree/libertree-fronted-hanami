require 'nokogiri'

RSpec.describe Web::Views::Post::Show, type: :view do
  let(:exposures) {
    {
      current_account: account,
      post: post,
    }
  }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/post/show.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:dom) { Nokogiri::HTML(rendered) }

  let(:account) { FactoryBot.create(:account) }
  let(:text) { "Some plain text with no markup." }
  let(:post) {
    FactoryBot.create(
      :post,
      member_id: account.member.id,
      text: text,
    )
  }

  it 'shows the text of the post' do
    expect(rendered).to include text
  end

  it 'has a link to like the post' do
    expect(dom.at(%|a[href="/post-like/#{post.id}"]:contains("like")|)).not_to be_nil
  end

  it 'has a link to unlike the post' do
    expect(dom.at(%|a[href="/post-unlike/#{post.id}"]:contains("unlike")|)).not_to be_nil
  end
end
