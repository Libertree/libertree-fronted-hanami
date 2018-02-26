RSpec.describe Web::Controllers::Post::LatestUnread, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[account has a home river]' do
      let(:river) {
        FactoryBot.create(
          :river,
          account_id: current_account.id,
          home: true,
        )
      }

      context '[an unread post exists in that river]' do
        let(:post) {
          FactoryBot.create(
            :post,
            member_id: current_account.member.id,
          )
        }

        before do
          river.add_post(post)
        end

        it 'redirects to the post' do
          response = action.call(params)

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq "/post/#{post.id}"
        end
      end
    end
  end
end
