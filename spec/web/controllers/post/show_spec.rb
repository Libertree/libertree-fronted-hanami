RSpec.describe Web::Controllers::Post::Show, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[id: post.id] }

  include_context '[signed in]' do
    let(:current_account) { FactoryBot.create(:account) }

    context '[a post exists]' do
      let(:post) {
        FactoryBot.create(
          :post,
          member_id: current_account.member.id,
        )
      }

      it 'is successful' do
        response = action.call(params)

        expect(response[0]).to eq 200
      end

      it 'exposes the post' do
        action.call(params)

        expect(action.exposures).to have_key(:post)
        expect(action.exposures[:post]).to eq post
      end
    end
  end
end
