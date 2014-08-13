on handle_string(msg)
   set wordArray to words of msg
   
   repeat with i from 1 to count words of msg
      if item i in wordArray is "every" then
         set everyNum to i
      else if item i in wordArray is "until" then
         set untilNum to i
      end if
   end repeat
   
   set intervalString to (item (everyNum + 1) in wordArray) as string
   set hourString to item (untilNum + 1) in wordArray as string
   set minString to item (untilNum + 2) in wordArray as string
   
   set reminderLength to -1 as number
   
   repeat with i from 1 to (everyNum - 1)
      set reminderLength to reminderLength + (count characters of item i in wordArray) + 1
   end repeat
   
   set reminder to (characters 1 thru reminderLength of msg) as string
   
   if ("s" is last character in intervalString) or ("m" is last character in intervalString) or ("h" is last character in intervalString) then
      
      set timeMod to last character in intervalString
      set repeatLength to (count characters of intervalString)
      set repeatDelay to (characters 1 thru (repeatLength - 1) of intervalString) as string
      
      if timeMod is "s" then
         set repeatDelay to repeatDelay as number
      else if timeMod is "m" then
         set repeatDelay to repeatDelay * 60 as number
      else if timeMod is "h" then
         set repeatDelay to repeatDelay * 360 as number
      end if
   else
      set repeatDelay to (intervalString * 60) as number
   end if
   
   
   set timeString to hourString & ":" & minString as string
   set totalDuration to (date timeString) - (date (time string of (current date))) as string
   
   set loopNum to (round (totalDuration / repeatDelay) rounding down) as number
   
   repeat with i from 1 to loopNum
      tell application "LaunchBar"
         display in large type reminder after delay (repeatDelay * i)
      end tell
   end repeat
   
   tell application "LaunchBar"
      display in large type reminder after delay totalDuration with sound "Glass"
   end tell
end handle_string
