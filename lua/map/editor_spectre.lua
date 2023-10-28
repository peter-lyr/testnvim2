local M = {}
local B = require 'my_base'
B.load_require_common()
M.source = B.get_source(debug.getinfo(1)['source'])
M.loaded = B.get_loaded(M.source)
M.config = B.rep_map_to_config(M.loaded)
-- package.loaded[M.loaded] = nil
--------------------------------------------

B.map_set_lua(M.config)

B.map_n('<leader>rw', 'open_visual_select_word', {})
B.map_v('<leader>rw', 'open_visual', {})

B.map('<leader>ro', 'open', {})
B.map('<leader>rc', 'open_file_search', {})

require 'spectre'.setup()

return M
