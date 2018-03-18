def directory_exists?(directory)
  directory.any?
end

if directory_exists?(Dir['/media/misigno/RECORD/RECORD/VOICE/*'])
  folder_string = '/media/misigno/RECORD/RECORD/VOICE/'
  stop_char     = 35
elsif directory_exists?(Dir['/media/misigno/RECORD/RECORD/'])
  folder_string = '/media/misigno/RECORD/RECORD/'
  stop_char     = 29
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

def rubybash(script)
  system 'osascript', *script.split(/\n/).map { |line| ['-e', line] }.flatten
end

dates.each do |date|
  i = 0
  out_file = File.new("/media/veracrypt3/aLg/ls/#{date}.txt", "w")

  while i <= 9 do
    out_file.puts("file #{folder_string}#{date}_0#{i}.WAV'")
    i += 1
  end

  out_file.close
end

dates.each do |date|
  `tmux new-window "ffmpeg -f concat -safe 0 -i /media/veracrypt3/aLg/ls/#{date}.txt -ac 1 -q:a 15 /media/veracrypt3/aLg/ARC/#{date}.mp3"`
end

