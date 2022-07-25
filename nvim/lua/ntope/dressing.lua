require('dressing').setup {
  select = {
    enabled = true,
    backend = { "telescope", "builtin" },
    telescope = require("telescope.themes").get_cursor {}
  }
}
