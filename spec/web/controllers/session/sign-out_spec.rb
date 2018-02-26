RSpec.describe Web::Controllers::Session::SignOut, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'signs out the current account' do
    expect(action).to receive(:sign_out_current_account)
    action.call(params)
  end
end
