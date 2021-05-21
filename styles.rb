 def message_warn( message)
    print TTY::Box.frame(message, width: TTY::Screen.width ,padding: 6 , align: :center).black.on_light_yellow
    puts
    puts
    puts
    puts
    puts
    puts
    puts
  end

  def message_success(message)
    print TTY::Box.frame(message,width: TTY::Screen.width,padding: 6 , align: :center).black.on_light_green.bold
    puts
    puts
    puts
    puts
    puts
    puts
    puts
  end

  def message_frame(message)
    puts
    print TTY::Box.frame(message,width: TTY::Screen.width, align: :center).light_white.on_light_blue.bold
  end

  def message_magenta(message)
    puts
    print TTY::Box.frame(message,width: TTY::Screen.width, align: :center).light_magenta.on_blue.bold    
  end

  def message_info(message)
    puts
    print TTY::Box.frame(message ,width: TTY::Screen.width, padding: 0, align: :center).black.on_light_white.bold
  end

  def message_f(message)
    print TTY::Box.frame(message ,width: TTY::Screen.width,padding: 2, align: :center).light_white.on_light_blue.blink.bold
  end

  def art
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts 
    puts 
    puts
    puts
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Wecome To The ')
    puts a.asciify('Burger Builder')
    puts
    puts 
    puts
    puts
    puts message_f(" ====== PRESS 'ENTER' TO CONTINUE ======")
    puts
    gets
    #print "\r" + ("\e[A\e[K"*6)
    Gem.win_platform? ? (system "cls") : (system "clear")
  end 