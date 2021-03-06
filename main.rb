

require 'dxopal'
include DXOpal

require_remote 'show_displays.rb'
require_remote 'enemy.rb'
require_remote 'player.rb'
require_remote 'bullet.rb'
require_remote 'game_system.rb'
require_remote 'score.rb'
require_remote 'effect.rb'
require_remote 'effects.rb'
require_remote 'enemy_movement.rb'

Image.register(:img_background, 'images/background.png')
Image.register(:img_title_background, 'images/title_background.png')
Image.register(:img_bullet, 'images/bullet.png')
Image.register(:img_effect, 'images/effect_animation.png')
Image.register(:img_enemy, 'images/enemy.png')
Image.register(:img_player, 'images/player.png')
Image.register(:img_score_background, 'images/score_background.png')

Window.load_resources do
    Window.bgcolor = C_WHITE
    Window.width = 640
    Window.height = 480

    display = :title
    display_prev = :result

    game = GameSystem.new

    Window.loop do
        if display == :title and display_prev == :result
            game = GameSystem.new
        end
        display_prev = display

        display =
            case display
                when :title
                    title() # show title-display
                when :game_main
                    game_main(game, game.hp)#show game-display
                when :result
                    result(game.score) # show result-display
            end
    end
end
