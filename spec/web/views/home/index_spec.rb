RSpec.describe Web::Views::Home::Index, type: :view do
  let(:account) { FactoryBot.create(:account) }
  let!(:river) {
    FactoryBot.create(
      :river,
      account_id: account.id,
      home: true,
    )
  }
  let(:num_unread) { 642 }

  before do
    allow_any_instance_of(Libertree::Model::River).to receive(:num_unread).and_return(num_unread)
  end

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

  it 'shows the number of unread posts' do
    expect(rendered).to include num_unread.to_s
  end
end
