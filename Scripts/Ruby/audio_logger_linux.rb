require 'pry'

def directory_exists?(directory)
  directory.any?
end

if directory_exists?(Dir['/media/misigno/USB-DISK/RECORD/'])
  folder_string = '/media/misigno/USB-DISK/RECORD/'
  stop_char     = 31
elsif directory_exists?(Dir['/media/misigno/RECORD/RECORD/VOICE/'])
  folder_string = '/media/misigno/RECORD/RECORD/VOICE/'
  stop_char     = 35
elsif directory_exists?(Dir['/media/misigno/RECORD/RECORD/'])
  folder_string = '/media/misigno/RECORD/RECORD/'
  stop_char     = 29
elsif directory_exists?(Dir['/media/misigno/DISK_IMG/RECORD/'])
  folder_string = '/media/misigno/DISK_IMG/RECORD/'
  stop_char     = 31 
elsif directory_exists?(Dir['/mnt/BNK/Hole/RECORD/RECORD/VOICE/'])
  folder_string = '/mnt/BNK/Hole/RECORD/RECORD/VOICE/'
  stop_char     = 34
else
  abort('ERROR: No files found.')
end

audio_files = Dir[folder_string + '*'] 
filtered = audio_files.select do |file|
  file.include?("_00")
end

dates = filtered.each do |name|
  name.slice!(0, stop_char)
  name.slice!(8, 14)
end

dates.each do |date|
  i = 0
  out_file = File.new("/mnt/gryEx/aLg/ls/#{date}.txt", "w")
  while i <= 9 do
    out_file.puts("file #{folder_string}#{date}_0#{i}.WAV'")
    i += 1
  end
  out_file.close
end

dates.each do |date|
  `tmux new-window "ffmpeg -f concat -safe 0 -i /mnt/gryEx/aLg/ls/#{date}.txt -ac 1 -q:a 15 /mnt/gryEx/aLg/ARC/#{date}.mp3"`
end

