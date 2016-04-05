#!/usr/bin/env stack
{- stack runghc --verbosity info --resolver lts-5.11 --package pandoc-types-1.16.1 -}

import Text.Pandoc.Builder
import Text.Pandoc.JSON

main :: IO ()
main = toJSONFilter removeManonlyBlocks

removeManonlyBlocks :: Block -> Block
removeManonlyBlocks (Div ("",["manonly"],[]) _) = Plain []
removeManonlyBlocks x = x