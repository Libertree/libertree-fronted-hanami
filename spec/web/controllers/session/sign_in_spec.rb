RSpec.describe Web::Controllers::Session::SignIn, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:call) { action.call(params) }

  context '[not signed in]' do
    it 'is successful' do
      response = call

      expect(response[0]).to eq 200
    end
  end

  context '[signed in]' do
    include_context '[signed in]' do
      let(:current_account) { FactoryBot.create(:account) }
    end

    it 'redirects to home' do
      response = call

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq "/home"
    end
  end
end
