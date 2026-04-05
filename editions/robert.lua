
SMODS.Edition {
    key = 'robert',
    shader = false,
    config = {
        extra = {
            mult0 = 10,
            chips0 = 100,
            xchips0 = 0.9,
            dollars0 = 1
        }
    },
    in_shop = true,
    weight = 5,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Robert',
        label = 'Robert',
        text = {
            [1] = '{C:red}+10{} Mult, {C:blue}+100{} Chips, {X:red,C:white}X0.9{} Mult, +1$'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                mult = 10,
                extra = {
                    chips = 100,
                    colour = G.C.CHIPS,
                    extra = {
                        x_chips = 0.9,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars + 1
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                                return true
                            end,
                            colour = G.C.MONEY
                        }
                    }
                }
            }
        end
    end
}