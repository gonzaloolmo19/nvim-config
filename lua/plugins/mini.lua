return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Highlight word under cursor
		require("mini.cursorword").setup()

		-- Highlight trailing whitespace
		require("mini.trailspace").setup()

		-- File Explorer
		require("mini.files").setup()
		vim.keymap.set("n", "-", function()
			require("mini.files").open()
		end, { desc = "Open parent directory" })

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
		require("mini.starter").setup({
			header = [=[
**############%+-====+==+==+--+##@@@@@@@@@@@@@@@@@@@@@@@@@@*
############%%%+-====+==+=+=:::-+@@@@@@@@@@@@@@@@@@@@@@@@@@*
#########%%%%%%+-====+==+==:--:::=++++**##%@@@@@@@@@@@@@@@@*
#######%%%%%%%%+-====+=++=-:------:::------=*#@@@@@@%%%%@@@*
####%%%%%%%%%%%+-====+=+==--:::-:::==:-----::-=**+==---*@@@*
###%%%%%%%%%%%@*-======+=-:::=-::=#%%-::-::::::::-----=@@@@#
#%%%%%%%%%%%%%@*-=+++#+-::::-::=#%%%%+:-:-::::::::::::%@@@@#
%%%%%%%%%%%%%%@*-+#%%#-::::::-#%%%%%%#:-:-:::::::::::*@%%%@*
%%%%%%%%%%%%%%@*-+#**-::.=--+*%%%%%%%#:::-::::-:::::-==+++++
%%%%%%%%%%%%%%@*=*+*+:::+%*#%%%%%%%%#*-=.:::::-.:-:--:----=+
%%%%%%%%%%%%@%%#%%%%=::-++=*%%%%%%%%@##+.-:::::.**+%#+::-+#*
%%%%%%%%%%%##%%#%%%#-::-*= .+%%%%%#**+#=++.::::+%=*%%%=+#%@#
%%%%%%%%@#+#@@@%%%%*:::*@+:-%%%%%%%+...:%+.::::#%*+**##@@@@#
%%%%%@@@*-:=%@@@@%#+::-%%%%%%%%%%%@*::==*+.:::-%%%*++*%@@@@#
%%%%@%*=:--:-*#%#+=-::=%%%%%%%%%%%%%%#%%@+.::==%%%##%%@@@@@#
%%@#+-::----:-*@+-==::=@%%%%%%%%%%%%%%%%%=.:--.#%%%%%#@@@@@#
@%=:::-:::::+%@@*-==:::+%%%%#%%%%%%%%%%%#:::: -%%%@@%%%%%@@#
*-::::::::-%@@%%=-==:::-*%%%##%%%%%%%%#=::::. -@@@@%%%%%%@@*
::::::::::=#%#@%-===::.-=*%%%%%%####*+++-.:...*%#%%@@*%%@@@*
::::::::::::::=+----::.-++=--====++++++=.:::  -----+**#%@@@*
=-::::::::::::::::::::.*@%%%#*+++++++++:.:#%=+-:--:::*@@@@@*
%%*+=-::::::::::::::::.+@%%@@#+=++++*%=.:#@%@%-::---:#@@@@@*
%%%@%%#*=::::::::::::+:=@%%%%#%**##%%#..*@%%@*::::--:#@@@@@*
%%%%%%%@%#*=-::::::.:%*-%%%%###%%###%-.*@%%%+::::::::%@@@@@*
%%%%%%%%%%%%%#+=::::*%%*#%%%######%%-:#%%%%=::::::::-%@@@@@*
--------------=--=--%%%@%%%%####%%%++%%%%%=:::::::::-%@%@%@*
::::::::::::::::-=-:+======++==+*#%%@%%%%=:::::::::::*@%%%@+
:::::::::::-:-:--=::..:.........::-+*#%%=::..:::::::-%%%%%%+
::::::::::::::::--:::::::::::::::::.::--:::..::::::-#@%%%%@+
::::::::::::::::--:::::::::::.::::::::..:::..++::::+#*****#=
]=],
		})
		-- Set the header color to Label group (usually purple/blue)
		vim.api.nvim_set_hl(0, "MiniStarterHeader", { link = "Label" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniStarterOpened",
			callback = function()
				vim.keymap.set("n", "-", function()
					require("mini.files").open()
				end, { buffer = true, desc = "Open parent directory" })
			end,
		})
	end,
}
