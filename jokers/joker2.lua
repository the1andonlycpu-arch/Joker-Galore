
SMODS.Joker{ --Joker?
    key = "joker2",
    config = {
        extra = {
            odds = 2,
            mult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Joker?',
        ['text'] = {
            [1] = '{C:red}+4{} Mult?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_jokergal_joker2') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_ded5d1a0', 1, card.ability.extra.odds, 'j_jokergal_joker2', true) then
                    SMODS.calculate_effect({mult = 4}, card)
                end
            end
        end
    end
}