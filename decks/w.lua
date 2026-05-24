SMODS.Back {
    key = "f",
    pos = { x = 0, y = 0 },
    config = { ante_scaling = 0.5 },
    loc_txt = {
        name = 'w',
        text = {
            [1] = '{C:attention}0.334X{} Blind Size.',
            [2] = '{C:red}-1{} Card Selection Limit'
        },
    },

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.ante_scaling } }
    end,
    -- The config field already handles the functionality so it doesn't need to be implemented
    -- The following is how the implementation would be
    --
    apply = function(self, back)
        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * self.config.ante_scaling
    end
    
}
