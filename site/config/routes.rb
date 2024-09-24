# frozen_string_literal: true

Rails.application.routes.draw do
  mount BeyondEssence::Engine => '/beyond_essence'
end
