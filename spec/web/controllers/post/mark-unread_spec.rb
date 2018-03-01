RSpec.describe Web::Controllers::Post::MarkUnread, type: :action do
  let(:action) { described_class.new }
  let(:params) { {} }
  let(:call) { action.call(params) }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[a read post exists]' do
      let(:post) {
        FactoryBot.create(
          :post,
          member_id: current_account.member.id,
        )
      }
      let(:params) { {post_id: post.id} }

      before do
        post.mark_as_read_by current_account
      end

      it 'marks the post as unread' do
        expect {
          call
        }.to change {
          post.read_by? current_account
        }.from(true).to(false)
      end

      context '[account has a home river]' do
        let(:river) {
          FactoryBot.create(
            :river,
            account_id: current_account.id,
            home: true,
          )
        }
        let!(:unread_post1) {
          FactoryBot.create(:post, member_id: current_account.member.id)
        }
        let!(:unread_post2) {
          FactoryBot.create(:post, member_id: current_account.member.id)
        }

        before do
          river.add_post(post)
          river.add_post(unread_post1)
          river.add_post(unread_post2)

          allow_any_instance_of(Libertree::Model::River).to(
            receive(:latest_unread).
            with(earlier_than_post: post).
            and_return(unread_post2)
          )
        end

        it 'redirects to the latest unread post' do
          response = call

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq "/post/#{unread_post2.id}"
        end
      end
    end
  end
end
