

require 'dxopal'
include DXOpal

require_remote 'show_displays.rb'

#Image.register(:player, 'images/player.png')


Window.load_resources do
    Window.bgcolor = C_WHITE
    Window.width  = 640
    Window.height = 480
    
    Window.loop do
        # Window.draw_font(0, 0, "Hello!", Font.default, color: C_WHITE)
        
        # show title-display
        title()
        
        # show game-display
        game_main()
        
        # show result-display
        result()
        
    end
end
