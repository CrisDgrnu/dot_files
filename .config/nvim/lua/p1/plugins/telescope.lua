local telescope_status, telescope = pcall(require,"telescope")
if not telescope_status then
  return
end

local actions, actions_plugin = pcall(require,"telescope.actions")
if not actions then
  return
end


local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-Up>"] = actions_plugin.move_selection_previous,
        ["<C-Down>"] = actions_plugin.move_selection_next,
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown({}),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")



