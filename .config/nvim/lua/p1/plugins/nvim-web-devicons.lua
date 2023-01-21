local status, nvim_wev_devicons = pcall(require,"nvim-web-devicons")
if not status then
  return
end

nvim_wev_devicons.set_icon({
  astro = {
    icon = "",
    color = "#ff6200",
    name = "Astro"
  }
})

