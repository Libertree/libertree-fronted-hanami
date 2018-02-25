require "spec_helper"

RSpec.describe Web::Views::ApplicationLayout, type: :view do
  let(:layout) { Web::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/web/templates/application.html.erb') }

  it 'contains the application name' do
    pending 'fix of https://github.com/hanami/hanami/issues/903'
    expect(rendered).to include('Libertree')
  end
end
