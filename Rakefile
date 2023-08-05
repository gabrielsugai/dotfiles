require 'rake'

desc 'Install My Dotfiles configs in your machine'
task :install do
  puts "Installing....."

  install_files(Dir.glob([
    "tmux.conf",
  ]))

  copy_config_files
  install_nvim_plugins
  installation_message
end

private

def dotfiles_folder
  "$HOME/.dotfiles"
end

def install_nvim_plugins
  system "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
end

def copy_config_files
  source = "#{ENV["PWD"]}/nvim"
  dir = "#{ENV["HOME"]}/.config/nvim"

  run_command %{ ln -nfs "#{source}" "#{dir}" }
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
  puts ''
  puts 'Thank you!'
  puts ''
  puts '======================================================================='
end

