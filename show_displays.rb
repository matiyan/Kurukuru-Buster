

# **** To show displays functions ****

def title()
    Window.draw(0,0,Image[:img_title_background])
    #Window.draw_font(Window.width / 2, Window.height / 2, "Title", Font.default, color: C_BLACK)
    Window.draw_font(80, Window.height / 2 + 40, "スペースを押してね", Font.default, color: C_BLACK)
    
    if Input.key_push? (K_SPACE) 
        return :game_main
    else 
        return :title
    end
end

def game_main(game)

        Window.draw_font(Window.width / 2, Window.height / 2, "game main", Font.default, color: C_BLACK)
    
        game.draw
        game.update
        Window.draw_font(Window.width / 2, Window.height / 2+40, "game main2", Font.default, color: C_BLACK)

    if Input.key_push? K_SPACE then :result
    else :game_main end
    
end

def result()
    Window.draw_font(Window.width / 2, Window.height / 2, "result", Font.default, color: C_BLACK)
    Window.draw_font(Window.width / 2, Window.height / 2+40, "Please press Space-Key", Font.default, color: C_BLACK)

    if Input.key_push? K_SPACE then :title
    else :result end
 
end