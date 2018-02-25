RSpec.describe Web::Controllers::Home::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    it 'exposes posts' do
      action.call(params)

      expect(action.exposures).to have_key(:current_account)
    end
  end
end
