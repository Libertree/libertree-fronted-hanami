RSpec.describe Web::Controllers::Notification::MarkUnseen, type: :action do
  let(:action) { described_class.new }
  let(:params) { {} }
  let(:call) { action.call(params) }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[a seen notification exists]' do
      let(:notification) {
        FactoryBot.create(
          :notification,
          account_id: current_account.id,
          data: '{}',
          seen: true,
        )
      }
      let(:params) { {notification_id: notification.id} }

      it 'marks the notification as unseen' do
        expect {
          call
        }.to change {
          notification.reload.seen
        }.from(true).to(false)
      end

      context '[referrer set]' do
        let(:params) {
          {
            notification_id: notification.id,
            'Referer' => 'foobar',
          }
        }

        it 'redirects to referrer' do
          response = call

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq 'foobar'
        end
      end

      context '[no referrer set]' do
        it 'redirects to home' do
          response = call

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq "/home"
        end
      end
    end
  end
end
