require 'rake'

desc 'Install My VIM configs in your machine'
task :install do
  puts "Installing....."

  install_files(Dir.glob([
    "tmux.conf",
    "vimrc",
    "vim",
  ]))

  install_init_vim
  install_vim_plugins
  install_lua_plugin_config
  installation_message
end

private

def my_vim_folder
  "$HOME/.my-vim"
end

def install_vim_plugins
  system "vim -N \"+set hidden\" \"+syntax on\" +PlugInstall +qall"
end

def install_init_vim
  run_command %{ mkdir -p "#{ENV["HOME"]}/.config/nvim" }
  source = "#{ENV["PWD"]}/init.vim"
  file = "#{ENV["HOME"]}/.config/nvim/init.vim"
  file_exists?(file)

  run_command %{ ln -nfs "#{source}" "#{file}" }
end

def install_lua_plugin_config
  run_command %{ mkdir -p "#{ENV["HOME"]}/.config/nvim/lua" }
  source = "#{ENV["PWD"]}/lua/plugins.lua"
  file = "#{ENV["HOME"]}/.config/nvim/lua/plugins.lua"
  file_exists?(file)

  run_command %{ ln -nfs "#{source}" "#{file}" }
end

def install_files(files)
  files.each do |f|
    file_name = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    file = "#{ENV["HOME"]}/.#{file_name}"
    file_exists?(file)

    run_command %{ ln -nfs "#{source}" "#{file}" }
  end
end

def file_exists?(file)
  if File.exists?(file)
    puts "Moving #{file} to #{file}.bkp"
    run_command %{ mv #{file} #{file}.bkp }
  end
end

def run_command(cmd)
  puts "running #{cmd}"
  system cmd
rescue
  puts "Error running #{cmd}"
end

def installation_message
  puts ''
  puts ''
  puts '======================================================================='
  puts 'run <:TSInstall ruby> on vim to install ruby highlight'
  puts 'Thank you!'
  puts ''
  puts ''
  puts '======================================================================='
end

