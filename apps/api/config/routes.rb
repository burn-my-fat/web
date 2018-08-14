# frozen_string_literal: true

# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
resources :workouts, only: %i[index create]
get '/muscle_groups', to: 'muscle_groups#index'
get '/training_types', to: 'training_types#index'
get '/muscles', to: 'muscles#index'
