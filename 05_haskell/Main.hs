--    /\
--   /  \
--   /  \
--  /  o \
--  /    \
-- / u    \
-- --------
--    ||
--    ||

module Main where

makeGroup :: Int -> Int -> [String]
makeGroup n len =
  [
    spaces (len - n) ++ "/" ++ spaces (n*2) ++ "\\",
    spaces (len - n - 1) ++ "/" ++ spaces ((n+1)*2) ++ "\\"
  ]
  where
    spaces = flip replicate ' '


main :: IO()
main = putStrLn $ unlines $ topPart ++ divider ++ trunk
  where
    groups = 8
    topPart = concat [makeGroup n groups | n <- [0..groups-1]] 
    divider = [replicate (groups * 2 + 2) '-']
    trunk = [ replicate groups ' ' ++ "||" | _ <- [0..1]]

