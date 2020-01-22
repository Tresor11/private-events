# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionHelper, type: :helper do
  describe 'current_user' do
    it 'concats two strings with spaces' do
      expect(current_user).to be_nil
    end
  end
end
