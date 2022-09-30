# Oblique Strategies

[Oblique Strategies](https://en.wikipedia.org/wiki/Oblique_Strategies) is a card-based method for promoting creativity jointly created by musician/artist Brian Eno and multimedia artist Peter Schmidt, first published in 1975.

![oblique-screenshot](https://user-images.githubusercontent.com/672917/193280372-00a220e9-cd8a-45e4-92f6-d62a9e0d5ac9.png)

## Installation

Using packer.nvim

```lua
use { 'davidgranstrom/oblique-strategies.nvim' }
```

## Usage

```lua
--- Display an oblique strategy in a floating window.
---@return The window ID.
require('oblique-strategies').show()

--- Get an oblique strategy as a string.
---@return A string.
require('oblique-strategies').get()
```

## Configuration

It is not necessary to call `setup` but the function is provided as a conveniece for styling and mapping.

```lua
require('oblique-strategies').setup{
  keymaps = {
    show = {
      n = '<F9>',
    },
  },
}
```

**Default configuration**

```lua
require('oblique-strategies').setup{
  win = {
    relative = 'editor',
    anchor = 'NW',
    width = 38,
    height = 7,
    focusable = false,
    border = 'single',
    style = 'minimal',
  },
  color = 'NormalFloat', -- built-in highlight-groups (:h winhl)
  keymaps = {},
}
```
