require_relative 'lib/game_presenter.rb'
require_relative 'lib/game_engine.rb'

engine = GameEngine.new
presenter = GamePresenter.new(engine)

presenter.start