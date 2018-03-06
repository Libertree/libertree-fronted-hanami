RSpec.describe Web::Controllers::Notification::MarkSeen, type: :action do
  let(:action) { described_class.new }
  let(:params) { {} }
  let(:call) { action.call(params) }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[2 unseen notifications exist]' do
      let(:notification) {
        FactoryBot.create(
          :notification,
          account_id: current_account.id,
          data: '{}',
          seen: false,
        )
      }
      let(:notification2) {
        FactoryBot.create(
          :notification,
          account_id: current_account.id,
          data: '{}',
          seen: false,
        )
      }
      let(:params) {
        {
          notification_ids: "#{notification.id},#{notification2.id}",
        }
      }

      it 'marks the notifications as seen' do
        expect {
          call
        }.to change {
          notification.reload.seen
        }.from(false).to(true).
        and change {
          notification2.reload.seen
        }.from(false).to(true)
      end

      context '[referrer set]' do
        let(:params) {
          {
            notification_ids: notification.id,
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
