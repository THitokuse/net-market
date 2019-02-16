require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with all column' do
        expect(build(:user)).to be_valid
      end

      it 'is valid without street' do
        expect(build(:user, street: nil)).to be_valid
      end

      it 'is valid without self_introduce' do
        expect(build(:user, self_introduce: nil)).to be_valid
      end

      it 'is valid without street and self_introduce' do
        expect(build(:user, street: nil, self_introduce: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without nickname' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include('を入力してください')
      end

      it 'is invalid without email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'is invalid without password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it 'is invalid without first_name' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include('を入力してください')
      end

      it 'is invalid without last_name' do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include('を入力してください')
      end

      it 'is invalid without first_name_kana' do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include('を入力してください')
      end

      it 'is invalid without last_name_kana' do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include('を入力してください')
      end

      it 'is invalid without tel' do
        user = build(:user, tel: nil)
        user.valid?
        expect(user.errors[:tel]).to include('を入力してください')
      end

      it 'is invalid without prefecture_code' do
        user = build(:user, prefecture_code: nil)
        user.valid?
        expect(user.errors[:prefecture_code]).to include('を入力してください')
      end

      it 'is invalid without zip' do
        user = build(:user, zip: nil)
        user.valid?
        expect(user.errors[:zip]).to include('を入力してください')
      end

      it 'is invalid without city_name' do
        user = build(:user, city_name: nil)
        user.valid?
        expect(user.errors[:city_name]).to include('を入力してください')
      end

      it 'is invalid without birth_year' do
        user = build(:user, birth_year: nil)
        user.valid?
        expect(user.errors[:birth_year]).to include('を入力してください')
      end

      it 'is invalid without birth_month' do
        user = build(:user, birth_month: nil)
        user.valid?
        expect(user.errors[:birth_month]).to include('を入力してください')
      end

      it 'is invalid without birth_day' do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include('を入力してください')
      end
    end
  end
end
