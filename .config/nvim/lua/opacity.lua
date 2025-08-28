local M = {}

-- Resolve the kitty binary even if PATH is minimal
local KITTY = (function()
  local p = vim.fn.exepath("kitty")
  if p == "" then p = "kitty" end
  return p
end)()

local function in_kitty()
  return (vim.env.TERM or ""):match("xterm%-kitty") ~= nil
end

-- Run kitty @ ... and report stderr if anything goes wrong
local function kitty_cmd(args)
  if not in_kitty() then return end
  vim.fn.jobstart(
    vim.list_extend({ KITTY, "@"}, args),
    {
      detach = true,
      on_stderr = function(_, data, _)
        -- Filter nil/empty noise
        if not data then return end
        local msg = table.concat(data, "\n")
        if msg:match("%S") then
          vim.notify("kitty stderr: "..msg, vim.log.levels.WARN)
        end
      end,
    }
  )
end

local function kitty_opacity(opacity)
  kitty_cmd({ "set-background-opacity", tostring(opacity) })
end

function M.setup() 
  local grp = vim.api.nvim_create_augroup("Kitty", { clear = true })

  vim.api.nvim_create_autocmd("VimEnter", {
	group = grp,
	callback = function()
	  kitty_opacity(1)
	end,
  })

  vim.api.nvim_create_autocmd("VimLeave", {
	group = grp,
	callback = function()
	  kitty_opacity(0.85)
	end,
  })
end

return M
