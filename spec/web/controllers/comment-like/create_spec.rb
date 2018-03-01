RSpec.describe Web::Controllers::CommentLike::Create, type: :action do
  let(:action) { described_class.new }
  let(:call) { action.call(params) }
  let(:flash) { action.exposures[:flash] }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[a post exists]' do
      let(:post) {
        FactoryBot.create(:post, member_id: current_account.member.id)
      }

      context '[the post has a comment]' do
        let(:comment) {
          FactoryBot.create(
            :comment,
            member_id: current_account.member.id,
            post_id: post.id,
          )
        }

        context "[the comment's id in the params]" do
          let(:params) { Hash[comment_id: comment.id] }

          it 'creates a like of the comment' do
            expect {
              call
            }.to change {
              Libertree::Model::CommentLike.where(comment_id: comment.id).count
            }.by(1)
          end

          it 'sets a success flash message' do
            call

            expect(flash[:success]).to match(/comment liked/i)
          end

          it 'redirects to the comment' do
            response = call

            expect(response[0]).to eq 302
              expect(response[1]['Location']).to eq "/post/#{post.id}#comment-#{comment.id}"
          end
        end

        context '[bad comment id in the params]' do
          let(:params) { Hash[comment_id: 0] }

          it 'does not create a like of the comment' do
            expect {
              call
            }.not_to change {
              Libertree::Model::CommentLike.where(comment_id: comment.id).count
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
end
