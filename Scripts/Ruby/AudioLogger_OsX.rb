def directory_exists?(directory)
  directory.any?
end

if directory_exists?(Dir['/Volumes/RECORD/RECORD/VOICE/*'])
  folder_string = '/Volumes/RECORD/RECORD/VOICE/'
  stop_char     = 29
elsif directory_exists?(Dir['/Volumes/RECORD/RECORD/'])
  folder_string = '/Volumes/RECORD/RECORD/'
  stop_char     = 23
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
  out_file = File.new("/Volumes/Gry_eX/aLg/ls/#{date}.txt", "w")

  while i <= 9 do
    out_file.puts("file #{folder_string}#{date}_0#{i}.WAV'")
    i += 1
  end

  out_file.close
end

dates.each do |date|
  rubybash <<-END
      tell application "iTerm"
      run
      tell the current window
        activate current session
        delay 0.2
        tell application "System Events" to keystroke "a" using control down
        delay 0.2
        tell application "System Events" to keystroke "c"
        delay 1.5
        tell the current session
          write text "ffmpeg -f concat -safe 0 -i /Volumes/Gry_eX/aLg/ls/#{date}.txt -ac 1 -q:a 15 /Volumes/Gry_eX/aLg/ARC/#{date}.mp3"
        end tell
      end tell
    end tell
  END
end

