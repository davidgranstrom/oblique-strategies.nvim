local strategies = {
  [[Remove specifics and convert to ambiguities]],
  [[Think of the radio]],
  [[Don't be frightened of clichés]],
  [[What is the reality of the situation?]],
  [[Are there sections? Consider transitions]],
  [[Turn it upside down]],
  [[Allow an easement (an easement is the abandonment of a stricture)]],
  [[Simple subtraction]],
  [[Remove specifics and convert to ambiguities]],
  [[Go slowly all the way round the outside]],
  [[A line has two sides]],
  [[Infinitesimal gradations]],
  [[Make an exhaustive list of everything you might do and do the last thing on the list]],
  [[Into the impossible]],
  [[Ask people to work against their better judgment]],
  [[Take away the elements in order of apparent non-importance]],
  [[Change instrument roles]],
  [[Accretion]],
  [[Disconnect from desire]],
  [[Emphasize repetitions]],
  [[Don't be afraid of things because they're easy to do]],
  [[Is there something missing?]],
  [[Don't be frightened to display your talents]],
  [[Breathe more deeply]],
  [[Honor thy error as a hidden intention]],
  [[Only one element of each kind]],
  [[Use unqualified people]],
  [[How would you have done it?]],
  [[Emphasize differences]],
  [[Do nothing for as long as possible]],
  [[Bridges
  -build
  -burn]],
  [[Water]],
  [[You don't have to be ashamed of using your own ideas]],
  [[Tidy up]],
  [[Do the words need changing?]],
  [[Ask your body]],
  [[Make a sudden, destructive unpredictable action; incorporate]],
  [[Consult other sources]],
  [[Use an unacceptable color]],
  [[Humanize something free of error]],
  [[Use filters]],
  [[Balance the consistency principle with the inconsistency principle]],
  [[Fill every beat with something]],
  [[Discard an axiom]],
  [[What wouldn't you do?]],
  [[Decorate, decorate]],
  [[Do nothing for as long as possible]],
  [[Listen to the quiet voice]],
  [[Is it finished?]],
  [[Put in earplugs]],
  [[Give the game away]],
  [[Reverse]],
  [[Abandon normal instruments]],
  [[Use fewer notes]],
  [[Repetition is a form of change]],
  [[Give way to your worst impulse]],
  [[Trust in the you of now]],
  [[What would your closest friend do?]],
  [[Distorting time]],
  [[Make a blank valuable by putting it in an exquisite frame]],
  [[The inconsistency principle]],
  [[Ghost echoes]],
  [[You can only make one dot at a time]],
  [[Just carry on]],
  [[(Organic) machinery]],
  [[Don't break the silence]],
  [[Discover the recipes you are using and abandon them]],
  [[Cascades]],
  [[Courage!]],
  [[What mistakes did you make last time?]],
  [[You are an engineer]],
  [[Consider different fading systems]],
  [[Mute and continue]],
  [[It is quite possible (after all)]],
  [[Don't stress one thing more than another]],
  [[Remove ambiguities and convert to specifics]],
  [[Look at the order in which you do things]],
  [[Go outside. Shut the door.]],
  [[Do we need holes?]],
  [[Cluster analysis]],
  [[Work at a different speed]],
  [[Do something boring]],
  [[Define an area as ‘safe’ and use it as an anchor]],
  [[Overtly resist change]],
  [[Accept advice]],
  [[Look closely at the most embarrassing details and amplify them]],
  [[Mechanicalize something idiosyncratic]],
  [[Emphasize the flaws]],
  [[Remember those quiet evenings]],
  [[Take a break]],
  [[The tape is now the music]],
  [[Short circuit
  (example; a man eating peas with the idea that they will improve his virility shovels them straight into his lap)]],
  [[Use an old idea]],
  [[Destroy
  -nothing
  -the most important thing]],
  [[Change nothing and continue with immaculate consistency]],
  [[Imagine the music as a moving chain or caterpillar]],
  [[Intentions
  -credibility of
  -nobility of
  -humility of]],
  [[Imagine the music as a set of disconnected events]],
  [[Imagine the piece as a set of disconnected events]],
  [[What are you really thinking about just now?]],
  [[Incorporate.]],
  [[Children's voices
  -speaking
  -singing]],
  [[Assemble some of the instruments in a group and treat the group]],
  [[Shut the door and listen from outside]],
  [[Is the tuning appropriate?]],
  [[Look at a very small object, look at its centre]],
  [[Feedback recordings into an acoustic situation]],
  [[Towards the insignificant]],
  [[Simply a matter of work]],
  [[Not building a wall but making a brick]],
  [[Revaluation (a warm feeling)]],
  [[Disciplined self-indulgence]],
  [[The most important thing is the thing most easily forgotten]],
  [[Idiot glee]],
  [[Be extravagant]],
  [[State the problem in words as clearly as possible]],
  [[Always first steps]],
  [[Question the heroic approach]],
  [[Always give yourself credit for having more than personality]],
  [[Faced with a choice, do both]],
  [[Tape your mouth]],
  [[Twist the spine]],
  [[Get your neck massaged]],
  [[Do the washing up]],
  [[Convert a melodic element into a rhythmic element]],
  [[Spectrum analysis]],
  [[Lowest common denominator check
  -single beat
  -single note
  -single riff]],
  [[Listen in total darkness, or in a very large room, very quietly]],
  [[Would anybody want it?]],
  [[Retrace your steps]],
  [[Go to an extreme, move back to a more comfortable place]],
  [[Once the search is in progress, something will be found]],
  [[Only a part, not the whole]],
  [[From nothing to more than nothing]],
  [[Be less critical more often]],
  [[ ]],
}

local M = {}
local default_config = {
  win = {
    relative = 'editor',
    anchor = 'NW',
    row = 0,
    col = 0,
    width = 48,
    height = 8,
    focusable = false,
    border = 'single',
    style = 'minimal',
  },
  keymaps = {},
}

local num_strategies = #strategies
local current_index = 1

math.randomseed(os.time())

local function shuffle()
  for i = num_strategies, 1, -1  do
    local j = math.random(i)
    local tmp = strategies[i]
    strategies[i] = strategies[j]
    strategies[j] = tmp
  end
end

local function next_strategy()
  if current_index == 1 then
    shuffle()
  end
  local str = strategies[current_index]
  current_index = current_index % num_strategies + 1
  return str
end

local function draw_card()
  local options = M.config and M.config.win or default_config.win
  local buf = vim.api.nvim_create_buf(false, true)
  options.col = (vim.api.nvim_list_uis()[1].width / 2) - (options.width / 2)
  options.row = (vim.api.nvim_list_uis()[1].height / 2) - (options.height / 2)
  local id = vim.api.nvim_open_win(buf, false, options)
  vim.api.nvim_create_autocmd('CursorMoved', {
    desc = 'Close oblique strategy',
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(id) then
        vim.api.nvim_win_close(id, true)
        if vim.api.nvim_buf_is_loaded(buf) then
          vim.api.nvim_buf_delete(buf, {force = true})
        end
      end
      return true
    end
  })
  local data = next_strategy()
  data = vim.split(data, '\n')
  vim.api.nvim_buf_set_lines(buf, 0, 0, true, data)
  vim.api.nvim_win_call(id, function()
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = options.width / 2
    vim.cmd[[normal! gggwG]]
    vim.cmd(string.format('%%center %d', options.width))
  end)
  local n = math.max(1, 3 - #data)
  for i = 0, n do
    vim.api.nvim_buf_set_lines(buf, 0, 0, true, {''})
  end
  return id
end

--- Set user configuration.
---@param user_config The configuration table.
function M.setup(user_config)
  user_config = user_config or {}
  M.config = vim.tbl_deep_extend('keep', user_config, default_config)
  if M.config.keymaps.show then
    for k, v in pairs(M.config.keymaps.show) do
      vim.keymap.set(k, v, M.show)
    end
  end
end

--- Draw an oblique strategy and display it in a floating window.
---@return The window ID.
function M.show()
  return draw_card()
end

--- Get an oblique strategy as a string.
---@return A string.
function M.get()
  return next_strategy()
end

return M
