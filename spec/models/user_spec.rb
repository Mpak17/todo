require 'rails_helper'

describe User do
  subject { FactoryBot.build(:user) }

  describe 'ActiveModel validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '#save' do
    context 'email and password valid' do
      subject { FactoryBot.build(:user, email: 'mpak17@gmail.com', password: '123456') }
      it 'create user' do
        expect { subject.save }.to change { User.count }.by(1)
      end
    end

    context 'password invalid' do
      subject { FactoryBot.build(:user, email: 'mpak17@gmail.com', password: '123') }
      it 'does not create user' do
        expect { subject.save }.not_to change { User.count }
      end
      it 'return correct error message' do
        subject.valid?
        expect(subject.errors.full_messages).to include(
          "Password #{I18n.t('errors.messages.too_short.other', count: User.password_length.min)}"
        )
      end
    end

    context 'password nil' do
      subject { FactoryBot.build(:user, email: 'mpak17@gmail.com', password: nil) }
      it 'does not create user' do
        expect { subject.save }.not_to change { User.count }
      end
      it 'return correct error message' do
        subject.valid?
        expect(subject.errors.full_messages).to include("Password #{I18n.t('errors.messages.blank')}")
      end
    end

    context 'email invalid' do
      subject { FactoryBot.build(:user, email: 'mpak17', password: '123456') }
      it 'does not create user' do
        expect { subject.save }.not_to change { User.count }
      end
      it 'return correct error message' do
        subject.valid?
        expect(subject.errors.full_messages).to include("Email #{I18n.t('errors.messages.invalid')}")
      end
    end

    context 'email nil' do
      subject { FactoryBot.build(:user, email: nil, password: '123456') }
      it 'does not create user' do
        expect { subject.save }.not_to change { User.count }
      end
      it 'return correct error message' do
        subject.valid?
        expect(subject.errors.full_messages).to include("Email #{I18n.t('errors.messages.blank')}")
      end
    end
  end

  describe '#destroy' do
    let!(:user) { FactoryBot.create(:user) }
    it 'destroy user' do
      expect { user.destroy }.to change { User.count }.from(1).to(0)
    end
  end
end
