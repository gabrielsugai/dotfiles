require 'rake'

desc 'Install My VIM configs in your machine'
task :install do
  puts "Installing....."

  install_files(Dir.glob([
    "tmux.conf",
    "vimrc",
    "vim",
  ]))

  install_vim_plugins
  installation_message
end

private

def my_vim_folder
  "$HOME/.my-vim"
end

def install_vim_plugins
  system "vim -N \"+set hidden\" \"+syntax on\" +PlugInstall +qall"
end

def install_files(files)
  files.each do |f|
    file_name = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    file = "#{ENV["HOME"]}/.#{file_name}"

    if File.exists?(file)
      puts "Moving #{file} to #{file}.bkp"
      run_command %{ mv #{file} #{file}.bkp }
    end

    run_command %{ ln -nfs "#{source}" "#{file}" }
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

