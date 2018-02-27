RSpec.describe Web::Controllers::PostLike::Delete, type: :action do
  let(:action) { described_class.new }
  let(:call) { action.call(params) }
  let(:flash) { action.exposures[:flash] }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[a post exists]' do
      let(:post) {
        FactoryBot.create(:post, member_id: current_account.member.id)
      }

      context '[the post is liked by the current account]' do
        before do
          FactoryBot.create(
            :post_like,
            member_id: current_account.member.id,
            post_id: post.id,
          )
        end

        context "[the post's id in the params]" do
          let(:params) { {post_id: post.id} }

          it 'removes the like of the post' do
            expect {
              call
            }.to change {
              Libertree::Model::PostLike.where(post_id: post.id).count
            }.by(-1)
          end

          it 'sets a success flash message' do
            call

            expect(flash[:success]).to match(/post unliked/i)
          end

          it 'redirects to the post' do
            response = call

            expect(response[0]).to eq 302
            expect(response[1]['Location']).to eq "/post/#{post.id}"
          end
        end

        context '[bad post id in the params]' do
          let(:params) { {post_id: 0} }

          it 'does not do anything to the likes of the post' do
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
end
