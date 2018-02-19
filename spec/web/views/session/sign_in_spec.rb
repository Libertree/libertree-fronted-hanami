RSpec.describe Web::Views::Session::SignIn, type: :view do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/session/sign_in.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'has a form for signing in' do
    expect(rendered).to match /name="username"/
    expect(rendered).to match /name="password"/
  end
end
