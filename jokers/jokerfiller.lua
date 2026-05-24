
SMODS.Joker{ --Joker Filler
    key = "jokerfiller",
    config = {
        extra = {
            u0_ = 0,
            repetitions = 1,
            chips0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Joker Filler',
        ['text'] = {
            [1] = 'This joker gives {X:red,C:white}?X{} Mult for every joker you have.',
            [2] = '{C:inactive}Currently {X:red,C:white}X?{}{}',
            [3] = '',
            [4] = '{C:inactive}?: This jokers abillility has not been implented yet{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.u0_}}
    end,
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({func = function()
                        
                        local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                        local rank_suffix = 'K'
                        local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                        local base_card = create_playing_card({
                            front = card_front,
                            center = G.P_CENTERS.m_jokergal_merchant
                        }, G.discard, true, false, nil, true)
                        
                        base_card:set_seal("jokergal_swapper", true)
                        
                        base_card:set_edition("e_robert", true)
                        
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        base_card.playing_card = G.playing_card
                        table.insert(G.playing_cards, base_card)
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand:emplace(base_card)
                                base_card:start_materialize()
                                SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                                return true
                            end
                        }))
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "BAROHNNNNNNNNN", colour = G.C.GREEN})
                end
            end
        end
        if context.other_joker  then
            return {
                chips = 10
            }
        end
    end
}