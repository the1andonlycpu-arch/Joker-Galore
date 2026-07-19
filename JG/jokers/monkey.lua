
SMODS.Joker{ --Monkey
    key = "monkey",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Monkey',
        ['text'] = {
            [1] = 'When {C:attention}blind{} is {C:attention}selected{}, create {C:attention}Gros Michel{}.',
            [2] = '{C:uncommon}1 in 10{} chance to destroy when triggered.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
        end
    end
}