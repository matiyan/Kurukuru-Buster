

require 'dxopal'
include DXOpal

require_remote 'show_displays.rb'

#Image.register(:player, 'images/player.png')


Window.load_resources do
    Window.bgcolor = C_WHITE
    Window.width  = 640
    Window.height = 480
    
    display = :title
    
    Window.loop do
        # Window.draw_font(0, 0, "Hello!", Font.default, color: C_WHITE)
        
        display = case display
        when :title then title() # show title-display
            when :game_main then game_main() # show game-display
            when :result then result() # show result-display
        end
    end
end
