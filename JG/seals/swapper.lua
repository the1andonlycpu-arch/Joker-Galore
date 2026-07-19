
SMODS.Seal {
    key = 'swapper',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Swapper',
        label = 'Swapper',
        text = {
            [1] = 'When this card is scored it swaps {C:blue}Chips{} and {C:red}Mult{}.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                swap = true
            }
        end
    end
}