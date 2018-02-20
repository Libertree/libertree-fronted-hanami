RSpec.describe Web::Controllers::Home::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  include_context "[signed in]" do
    let(:current_account) { FactoryBot.create(:account) }

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end
  end
end
