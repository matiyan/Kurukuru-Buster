

require 'dxopal'
include DXOpal

require_remote 'show_displays.rb'
require_remote 'enemy.rb'
require_remote 'player.rb'
require_remote 'bullet.rb'
require_remote 'game_system.rb'

#Image.register(:img_background, 'images/background.png')
#Image.register(:img_title_background, 'images/title_background.png')
#Image.register(:img_bullet, 'image/bullet.png')
#Image.register(:img_effect, 'images/effect.png')
#Image.register(:img_enemy, 'images/enemy.png')
#Image.register(:img_player, 'images/player.png')


Window.load_resources do
    Window.bgcolor = C_WHITE
    Window.width  = 640
    Window.height = 480
    
    display = :title
    game = GameSystem.new

    Window.loop do        
        display = case display
            when :title then title() # show title-display
            when :game_main then game_main() # show game-display
            when :result then result() # show result-display
        end
    end
end
