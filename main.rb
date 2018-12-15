

require 'dxopal'
include DXOpal

require_remote 'show_displays.rb'
require_remote 'enemy.rb'
require_remote 'player.rb'
require_remote 'bullet.rb'
require_remote 'game_system.rb'

#Image.register(:player, 'images/player.png')


Window.load_resources do
    Window.bgcolor = C_WHITE
    Window.width  = 640
    Window.height = 480
    
    display = :title
    ame = new GameSystem

    Window.loop do        
        display = case display
            when :title then title() # show title-display
            when :game_main then game_main() # show game-display
            when :result then result() # show result-display
        end
    end
end
