local status, inc_rename = pcall(require,"inc_rename")
if not status then
  return
end

inc_rename.setup({
  post_hook = function() vim.cmd(":wa") end
})
