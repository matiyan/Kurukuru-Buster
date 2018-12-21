

require 'dxopal'
include DXOpal

require_remote 'show_displays.rb'
require_remote 'enemy.rb'
require_remote 'player.rb'
require_remote 'bullet.rb'
require_remote 'game_system.rb'
require_remote 'score.rb'

Image.register(:img_background, 'images/background.png')
Image.register(:img_title_background, 'images/title_background.png')
Image.register(:img_bullet, 'images/bullet.png')
#Image.register(:img_effect, 'images/effect.png')
Image.register(:img_enemy, 'images/enemy.png')
Image.register(:img_player, 'images/player.png')

#Sound.resister(:snd_game, 'sounds/while_game.mp3')
#Sound.resister(:snd_opening, 'sounds/opening.mp3')
#Sound.resister(:snd_gameover, 'sounds/gameover.mp3')

msc_game = Sound._load('sounds/while_game.mp3')
msc_opening = Sound._load('sounds/opening.mp3')
msc_gameover = Sound._load('sounds/gameover.mp3')


Window.load_resources do
    Window.bgcolor = C_WHITE
    Window.width = 640
    Window.height = 480
    
    display = :title
    display_prev = :result
    
    game = GameSystem.new
    
    
    Window.loop do
        display = 
            case display
                when :title 
                    title() # show title-display
                when :game_main 
                    game_main(game)#show game-display
                when :result 
                    result(game) # show result-display
            end

        # 画面が遷移したら音楽を変える
        if display != display_prev then
            stop_msc = case display_prev 
                when :title
                    msc_opening
                when :game_main
                    msc_game
                when :result
                    msc_gameover
                end

            start_msc = case display
                when :title
                    msc_opening
                when :game_main
                    msc_game
                when :result
                    msc_gameover
                end

            stop_msc.stop
            #start_msc.loopCount= -1  # infinity playing
            start_msc.play
        end
        
        display_prev = display
    end
end