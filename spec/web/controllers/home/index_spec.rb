RSpec.describe Web::Controllers::Home::Index, type: :action do
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

      context '[river has a post]' do
        let(:post) {
          FactoryBot.create(
            :post,
            member_id: current_account.member.id,
          )
        }

        before do
          river.add_post(post)
        end

        it 'is successful' do
          response = action.call(params)

          expect(response[0]).to eq 200
        end

        it 'exposes posts' do
          action.call(params)

          expect(action.exposures).to have_key(:posts)
        end
      end
    end
  end
end
