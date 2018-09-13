hs.hotkey.bind({"cmd", "alt"}, "F1", function()
  local tallScreen = nil
  for _, s in pairs(hs.screen.allScreens()) do
      if s:rotate() ~= 0 then
          tallScreen = s
          break
      end
  end

  local app = hs.application.find("iTerm2")

  local termsWins = {}
  local firstTermWin = nil
  local emacsWin = nil
  for _, win in pairs(hs.application.find("iTerm2"):allWindows()) do
      if string.find(win:title(), "tmux-terms-start", 1, true) then
          termsWins[win:title()] = win
          if firstTermWin == nil then
              firstTermWin = win
          end
      end
      if string.find(win:title(), "^1") then
          emacsWin = win
      end
  end

  local termsWinTitles = {}
  for title in pairs(termsWins) do
      table.insert(termsWinTitles, title)
  end
  table.sort(termsWinTitles)

  local screenFrame = tallScreen:frame()

  local windowLayout = {}
  for i, title in ipairs(termsWinTitles) do
      if i > 4 then
          break
      end

      local win = termsWins[title]
      local f = win:frame()
      if i == 1 then
          f.x = screenFrame.x
          f.y = screenFrame.y+screenFrame.h - (f.h*2)
      elseif i == 2 then
          f.x = screenFrame.x + f.w
          f.y = screenFrame.y+screenFrame.h - (f.h*2)
      elseif i == 3 then
          f.x = screenFrame.x
          f.y = screenFrame.y + screenFrame.h - f.h
      else
          f.x = screenFrame.x + f.w
          f.y = screenFrame.y + screenFrame.h - f.h
      end               

      win:moveToScreen(tallScreen)
      win:setFrame(f)
  end

  local emacsF = emacsWin:frame()
  emacsF.x = screenFrame.x
  emacsF.y = screenFrame.y
  emacsF.w = screenFrame.w
  emacsF.h = screenFrame.h - firstTermWin:frame().h * 2

  emacsWin:moveToScreen(tallScreen)
  emacsWin:setFrame(emacsF)
end)

hs.hotkey.bind({"cmd", "alt"}, "F2", function()
  local tallScreen = nil
  for _, s in pairs(hs.screen.allScreens()) do
      if s:rotate() ~= 0 then
          tallScreen = s
          break
      end
  end

  local app = hs.application.find("iTerm2")

  local termsWins = {}
  local firstTermWin = nil
  for _, win in pairs(hs.application.find("iTerm2"):allWindows()) do
      if string.find(win:title(), "tmux-terms-start", 1, true) then
          termsWins[win:title()] = win
          if firstTermWin == nil then
              firstTermWin = win
          end
      end
  end

  local termsWinTitles = {}
  for title in pairs(termsWins) do
      table.insert(termsWinTitles, title)
  end
  table.sort(termsWinTitles)

  local screenFrame = tallScreen:frame()

  local windowLayout = {}
  for i, title in ipairs(termsWinTitles) do
      if i > 4 then
          break
      end

      local win = termsWins[title]
      local f = win:frame()
      if i == 1 then
          f.x = screenFrame.x
          f.y = screenFrame.y+screenFrame.h - (f.h*2)
      elseif i == 2 then
          f.x = screenFrame.x + f.w
          f.y = screenFrame.y+screenFrame.h - (f.h*2)
      elseif i == 3 then
          f.x = screenFrame.x
          f.y = screenFrame.y + screenFrame.h - f.h
      else
          f.x = screenFrame.x + f.w
          f.y = screenFrame.y + screenFrame.h - f.h
      end               

      win:moveToScreen(tallScreen)
      win:setFrame(f)
  end
end)

