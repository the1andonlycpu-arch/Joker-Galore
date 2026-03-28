
SMODS.Joker{ --The Beckoning
    key = "thebeckoning",
    config = {
        extra = {
            Size = 1,
            Scale = 2,
            Antes = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Beckoning',
        ['text'] = {
            [1] = '{C:red}#1#X{} Blind Size When A Boss Is Defeated.',
            [2] = '{C:inactive,s:0.9}Antes Survived:#3# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "jokergal_decks_only",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Size, card.ability.extra.Scale, card.ability.extra.Antes}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:set_edition("e_negative", true)
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            local Scale_value = card.ability.extra.Scale
            return {
                func = function()
                    card.ability.extra.Size = (card.ability.extra.Size) * card.ability.extra.Scale
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Scale = (card.ability.extra.Scale) + 0.5
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.Antes = (card.ability.extra.Antes) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            }
        end
        if context.setting_blind  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.Size).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.Size
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}