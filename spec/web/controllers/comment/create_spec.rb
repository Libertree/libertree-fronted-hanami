RSpec.describe Web::Controllers::Comment::Create, type: :action do
  let(:action) { described_class.new }
  let(:text) { "This is a new comment." }
  let(:post_id) { nil }
  let(:params) {
    {
      post_id: post_id,
      text: text,
    }
  }
  let(:call) { action.call(params) }
  let(:flash) { action.exposures[:flash] }

  context '[signed in]' do
    include_context '[signed in]' do
      let(:current_account) { FactoryBot.create(:account) }
    end

    context '[a post exists]' do
      let(:post) {
        FactoryBot.create(:post, member_id: current_account.member.id)
      }

      context "[the post's id in the params]" do
        let(:post_id) { post.id }

        it 'creates a comment on the post' do
          expect {
            call
          }.to change {
            Libertree::Model::Comment.where(post_id: post.id).count
          }.by(1)

          comment = Libertree::Model::Comment.last

          expect(comment.text).to eq text
        end

        it 'sets a success flash message' do
          call

          expect(flash[:success]).to match(/comment added/i)
        end

        it 'redirects to the post' do
          response = call

          expect(response[0]).to eq 302
          expect(response[1]['Location']).to eq "/post/#{post.id}"
        end
      end

      context '[bad post id in the params]' do
        let(:params) { Hash[post_id: 0] }

        it 'does not create a comment' do
          expect {
            call
          }.not_to change {
            Libertree::Model::Comment.where(post_id: post.id).count
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
