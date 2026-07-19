SMODS.Stake {
    name = "custom",
    key = "cust",
    unlocked_stake = "red",
    unlocked = true,
    prefix_config = { applied_stakes = { mod = false } },
    applied_stakes = { "cry_ascendant" },
    pos = { x = 0, y = 0 },
    sticker_pos = { x = 1, y = 0 },
    loc_txt = {
    ['name'] = 'FINAL BOSS',
    ['text'] = {
            [1] = '5X scaling size.',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) * 5
    end,
    colour = G.C.WHITE,
}
SMODS.Stake {
    name = "custowm",
    key = "cuswt",
    unlocked_stake = "red",
    unlocked = true,
    applied_stakes = {},
    pos = { x = 0, y = 0 },
    sticker_pos = { x = 1, y = 0 },
    loc_txt = {
        ['name'] = 'Obsidian Stake',
        ['text'] = {
            [1] = '2X base blind size per ante.',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    calculate = function(self,context)
	if context.ante_change then
           G.GAME.starting_params.ante_scaling = 2^G.GAME.round_resets.ante
	end
    end,
    colour = G.C.WHITE,
}
