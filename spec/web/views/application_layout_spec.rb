require "spec_helper"

RSpec.describe Web::Views::ApplicationLayout, type: :view do
  let(:layout) { Web::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/web/templates/application.html.erb') }

  it 'contains the application name' do
    pending 'fix of https://github.com/hanami/hanami/issues/903'
    expect(rendered).to include('Libertree')
  end

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    it "shows the account's username" do
      pending 'fix of https://github.com/hanami/hanami/issues/903'
      expect(rendered).to match /signed in/i
      expect(rendered).to include account.username
    end
  end

  context '[not signed in]' do
    it "does not mention being signed in" do
      pending 'fix of https://github.com/hanami/hanami/issues/903'
      expect(rendered).not_to match /signed in/i
    end
  end

end
