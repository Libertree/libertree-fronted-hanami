RSpec.shared_context "[signed in]" do
  let(:session_account) { FactoryBot.create(:session_account, account_id: current_account.id) }
  let(:session) { {'session_id' => session_account.sid} }

  before do
    allow(action).to receive(:session).and_return(session)
  end
end
