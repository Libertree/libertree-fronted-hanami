RSpec.describe Web::Views::Home::Index, type: :view do
  let(:account) { FactoryBot.create(:account) }
  let(:exposures) {
    { current_account: account, }
  }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'has a title' do
    expect(rendered).to match /Home/
    expect(rendered).to include account.username
  end
end
