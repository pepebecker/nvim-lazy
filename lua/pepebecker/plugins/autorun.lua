local buffer_number = -1

local function log(_, data)
  if data then
    -- Make it temporarily writable so we don't have warnings.
    vim.api.nvim_buf_set_option(buffer_number, "readonly", false)

    -- Append the data.
    vim.api.nvim_buf_set_lines(buffer_number, -1, -1, true, data)

    -- Make readonly again.
    vim.api.nvim_buf_set_option(buffer_number, "readonly", true)

    -- Mark as not modified, otherwise you'll get an error when
    -- attempting to exit vim.
    vim.api.nvim_buf_set_option(buffer_number, "modified", false)

    -- Get the window the buffer is in and set the cursor position to the bottom.
    local buffer_window = vim.api.nvim_call_function("bufwinid", { buffer_number })
    local buffer_line_count = vim.api.nvim_buf_line_count(buffer_number)
    vim.api.nvim_win_set_cursor(buffer_window, { buffer_line_count, 0 })
  end
end

local function open_buffer(name)
  -- Get a boolean that tells us if the buffer number is visible anymore.
  --
  -- :help bufwinnr
  local buffer_visible = vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= -1

  if buffer_number == -1 or not buffer_visible then
    -- Create a new buffer with a name.
    -- Same name will reuse the current buffer.
    local bufName = name or "Output"
    vim.api.nvim_command("botright vsplit " .. bufName)

    -- Collect the buffer's number.
    buffer_number = vim.api.nvim_get_current_buf()

    -- Mark the buffer as readonly.
    vim.opt_local.readonly = true
  end
end

local M = {}

function M.execute(cmd, output_name)
  -- Open our buffer, if we need to.
  open_buffer(output_name or "Output")
  -- Clear the buffer's contents incase it has been used.
  vim.api.nvim_buf_set_lines(buffer_number, 0, -1, true, {})
  -- Run the command.
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = log,
    on_stderr = log,
  })
end

local autorun_group = vim.api.nvim_create_augroup("autorun", { clear = true })
function M.start(pattern, command)
  M.stop()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = pattern,
    callback = function(ev)
      local interpolated_cmd = command:gsub("{}", ev.file)
      local cmd = vim.split(interpolated_cmd, " ")
      local output_name = "$ " .. interpolated_cmd
      print("Starting autocmd for " .. pattern .. " with command " .. output_name)
      M.execute(cmd, output_name)
    end,
    group = autorun_group,
  })
end

function M.stop()
  vim.api.nvim_command("autocmd! autorun")
end

function M.setup()
  vim.api.nvim_create_user_command("AutoRun", function(opts)
    if opts.args == "stop" then
      M.stop()
    else
      local pattern = vim.fn.input("Pattern: ")
      local command = vim.fn.input("Command: ")
      M.start(pattern, command)
    end
  end, {
    nargs = "?",
    complete = function(_, _, _)
      return { "start", "stop" }
    end,
  })

  vim.api.nvim_create_user_command("Run", function()
    local command = vim.fn.input("Command: ")
    M.execute(command)
  end, {})
end

M.setup()

return M
