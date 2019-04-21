require 'rails_helper'

describe ItemsController do
    let(:delivery_date)     {create(:delivery_date) }
    let(:delivery_burden)   {create(:delivery_burden)}
    let(:delivery_method)   {create(:delivery_method)}
    let(:user)              {create(:user)}
    let(:brand)             {create(:brand)}
    let(:condition)         {create(:condition)}
    let(:status)            {create(:status)}

    describe 'GET #index' do
        it "Is @items purchased and in the female category? " do
            @items = create_list(:item, 3, delivery_date_id: delivery_date.id, delivery_burden_id: delivery_burden.id, delivery_method_id: delivery_method.id,
                user_id: user.id, brand_id: brand.id, condition_id: condition.id, status_id: status.id)
            get :index
            expect(assigns(:items)).to match(@items.sort{ |a, b| b.created_at <=> a.created_at } )
        end

        it "Is @ladies_items purchased and in the female category? " do
            @ladies_items = create_list(:item, 3, delivery_date_id: delivery_date.id, delivery_burden_id: delivery_burden.id, delivery_method_id: delivery_method.id,
                user_id: user.id, brand_id: brand.id, condition_id: condition.id, status_id: status.id, upper_category_id: 1)
            get :index
            expect(assigns(:ladies_items)).to match(@ladies_items.sort{ |a, b| b.created_at <=> a.created_at } )
        end

        it "Is @mens_items purchased and in the female category? " do
            @mens_items = create_list(:item, 3, delivery_date_id: delivery_date.id, delivery_burden_id: delivery_burden.id, delivery_method_id: delivery_method.id,
                user_id: user.id, brand_id: brand.id, condition_id: condition.id, status_id: status.id, upper_category_id: 2)
            get :index
            expect(assigns(:mens_items)).to match(@mens_items.sort{ |a, b| b.created_at <=> a.created_at } )
        end

        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end
end