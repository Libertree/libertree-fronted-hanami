RSpec.describe Web::Views::Home::Index, type: :view do
  let(:account) { FactoryBot.create(:account) }
  let(:post) {
    FactoryBot.create(
      :post,
      member_id: account.member.id,
    )
  }

  let(:exposures) {
    {
      current_account: account,
      posts: [post],
    }
  }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'has a title' do
    expect(rendered).to match /Home/
  end

  it "shows the account's username" do
    expect(rendered).to include account.username
  end

  it 'shows the text of the posts' do
    expect(rendered).to include post.text
  end
end
