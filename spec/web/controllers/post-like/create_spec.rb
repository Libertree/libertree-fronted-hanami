RSpec.describe Web::Controllers::PostLike::Create, type: :action do
  let(:action) { described_class.new }
  let(:call) { action.call(params) }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[a post exists]' do
      let(:post) {
        FactoryBot.create(:post, member_id: current_account.member.id)
      }

      context "[the post's id in the params]" do
        let(:params) { Hash[post_id: post.id] }

        it 'creates a like of the post' do
          expect {
            call
          }.to change {
            Libertree::Model::PostLike.where(post_id: post.id).count
          }.by(1)
        end

        it 'redirects to the post' do
          response = call

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq "/post/#{post.id}"
        end
      end

      context '[bad post id in the params]' do
        let(:params) { Hash[post_id: 0] }

        it 'does not create a like of the post' do
          expect {
            call
          }.not_to change {
            Libertree::Model::PostLike.where(post_id: post.id).count
          }
        end

        it 'redirects to home' do
          response = call

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq "/home"
        end
      end
    end
  end
end
