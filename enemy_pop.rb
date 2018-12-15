#敵の生成
def(level, time)#レベルと時間(合計フレーム)

    #レベルによって間隔を変える
    @check = 120/level
    
    if time % @check == 0 then
        @esize = 50 #大体の画像サイズ
        @winsze = 500 #大体のウィンドウサイズ
        if rand(0,1)==0 then #右か左
            @popx = rand(0,1)*@winsize-@esize
            @popy = rand(0,@wnsize)-@esize
        else #上か下
            @popx = rand(0,@wnsize)-@esize
            @popy = rand(0,1)*@winsize-@esize
        end
    #GameSystemのenemiesに生成していれる
    ame.enemies << new Enemies(@popx, @popy)
    end
    
end

###########################################################
#GameSystemの
#@enemies = []
#        10.times {
#           @enemies << new Enemies(rand(0, Window.width), rand(0, Window.height))
#}
#のところの代わり
#この仕様のままならmain.rbで呼び出す
###########################################################
