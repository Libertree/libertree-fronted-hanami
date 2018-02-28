RSpec.describe Web::Controllers::Post::Show, type: :action do
  let(:action) { described_class.new }
  let(:params) { {id: post.id} }
  let(:call) { action.call(params) }
  let(:flash) { action.exposures[:flash] }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[the id is invalid]' do
      let(:post) { Libertree::Model::NilPost.new }

      it 'sets the error flash' do
        call

        expect(flash[:error]).to match(/could not display/i)
      end

      it 'redirects to home' do
        response = call

        expect(response[0]).to eq 302
        expect(response[1]['Location']).to eq '/home'
      end
    end

    context '[a post exists]' do
      let(:post) {
        FactoryBot.create(
          :post,
          member_id: current_account.member.id,
        )
      }

      it 'is successful' do
        response = call

        expect(response[0]).to eq 200
      end

      it 'exposes the post' do
        call

        expect(action.exposures).to have_key(:post)
        expect(action.exposures[:post]).to eq post
      end
    end
  end
end
