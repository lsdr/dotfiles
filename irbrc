# load a bunch of useful libs
[
  'irb/completion',
  'looksee',
  'pry',
  'ap'
].each do |_gem|
  begin
    require _gem
  rescue LoadError => e
    puts e.message
  end
end

begin
  # IRB.conf[:USE_READLINE] = true
  IRB.conf[:AUTO_INDENT]  = true
  
  # prompt pimp; stolen from fnando (github.com/fnando/dotfiles)
  prompt = "\033[1;30m#{RUBY_VERSION}\033[0m"

  IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_C => "#{prompt} \033[0;36m?>\033[0m ",
    :RETURN   => "=> %s\n",
    :PROMPT_I => "#{prompt} \033[0;36m>>\033[0m ",
    :PROMPT_N => "#{prompt} \033[0;36m>>\033[0m ",
    :PROMPT_S => nil }
    
  IRB.conf[:PROMPT_MODE] = :CUSTOM
rescue Exception => e
  puts e.message
end

