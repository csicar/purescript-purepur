module Main where

import Data.Function
import Control.Monad.Eff
import Debug.Trace

f = mkFn2 $ \a b -> runFn2 g a b + runFn2 g b a

g = mkFn2 $ \a b -> case {} of
  _ | a <= 0 || b <= 0 -> b
  _ -> runFn2 f (a - 1) (b - 1)

main = do
  runFn0 (mkFn0 $ \_ -> trace $ show 0)
  runFn1 (mkFn1 $ \a -> trace $ show a) 1
  runFn2 (mkFn2 $ \a b -> trace $ show [a, b]) 1 2
  runFn3 (mkFn3 $ \a b c -> trace $ show [a, b, c]) 1 2 3
  runFn4 (mkFn4 $ \a b c d -> trace $ show [a, b, c, d]) 1 2 3 4
  runFn5 (mkFn5 $ \a b c d e -> trace $ show [a, b, c, d, e]) 1 2 3 4 5
  print $ runFn2 g 15 12
  trace "Done!"
