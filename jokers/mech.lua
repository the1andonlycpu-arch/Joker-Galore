
SMODS.Joker{ --Mech
    key = "mech",
    config = {
        extra = {
            M1 = 0,
            C1 = 0,
            M2 = 1,
            C2 = 1,
            M3 = 1,
            C3 = 1,
            M4 = 1,
            C4 = 1,
            hypermult_arrows0 = 2,
            hyperchips_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mech',
        ['text'] = {
            [1] = 'This joker gains:',
            [2] = '{C:red}+1{} Mult, {C:blue}+10{} Chips,',
            [3] = '{X:red,C:white}X0.25{} Mult, {X:blue,C:white}X0.1{} Chips,',
            [4] = '{C:dark_edition}^0.02{} Mult, {C:dark_edition}^0.01{} Chips,',
            [5] = '{C:dark_edition}^^0.005{} Mult, and {C:dark_edition}^^0.002{} Chips',
            [6] = 'When the round ends.',
            [7] = '{C:inactive}Currently:',
            [8] = '{C:red}#1# {} {C:blue}#2# {} {X:red,C:white}#3# {} {X:chips,C:white} #4# {} {C:dark_edition}M: ^#5# C: ^#6# HM: ^^#7# HC: ^^#8# {}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.M1, card.ability.extra.C1, card.ability.extra.M2, card.ability.extra.C2, card.ability.extra.M3, card.ability.extra.C3, card.ability.extra.M4, card.ability.extra.C4}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.M1 = (card.ability.extra.M1) + 1
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.C1 = (card.ability.extra.C1) + 10
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.M2 = (card.ability.extra.M2) + 0.25
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.C2 = (card.ability.extra.C2) + 0.1
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    card.ability.extra.M3 = (card.ability.extra.M3) + 0.02
                                    return true
                                end,
                                colour = G.C.GREEN,
                                extra = {
                                    func = function()
                                        card.ability.extra.C3 = (card.ability.extra.C3) + 0.01
                                        return true
                                    end,
                                    colour = G.C.GREEN,
                                    extra = {
                                        func = function()
                                            card.ability.extra.M4 = (card.ability.extra.M4) + 0.005
                                            return true
                                        end,
                                        colour = G.C.GREEN,
                                        extra = {
                                            func = function()
                                                card.ability.extra.C4 = (card.ability.extra.C4) + 0.002
                                                return true
                                            end,
                                            colour = G.C.GREEN
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.M1,
                extra = {
                    chips = card.ability.extra.C1,
                    colour = G.C.CHIPS,
                    extra = {
                        Xmult = card.ability.extra.M2,
                        extra = {
                            x_chips = card.ability.extra.C2,
                            colour = G.C.DARK_EDITION,
                            extra = {
                                e_mult = card.ability.extra.M3,
                                colour = G.C.DARK_EDITION,
                                extra = {
                                    e_chips = card.ability.extra.C3,
                                    colour = G.C.DARK_EDITION,
                                    extra = {
                                        hypermult = {
                                            2,
                                            card.ability.extra.M4
                                        },
                                        colour = G.C.DARK_EDITION,
                                        extra = {
                                            hyperchips = {
                                                2,
                                                card.ability.extra.C4
                                            },
                                            colour = G.C.DARK_EDITION
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        end
    end
}