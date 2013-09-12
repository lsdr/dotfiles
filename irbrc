%w(looksee pry ap).each do |_gem|
  begin
    require _gem
  rescue LoadError => e
    warn e.message
  end
end

if defined?(Pry)
  Pry.start
  exit
else
  require 'irb/completion'
  prompt = "\033[1;30m#{RUBY_VERSION}\033[0m"
  
  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_C => "#{prompt} \033[0;36m?>\033[0m ",
    :RETURN   => "=> %s\n",
    :PROMPT_I => "#{prompt} \033[0;36m>>\033[0m ",
    :PROMPT_N => "#{prompt} \033[0;36m>>\033[0m ",
    :PROMPT_S => nil }
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
