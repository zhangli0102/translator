module Translator
    ( Chinese
    , English
    , englishToChinese
    , chineseToEnglish
    , engToCh
    , chToEng
    ) where

import qualified Data.Map as M

type Chinese = String
type English = String

englishToChinese :: (M.Map English Chinese)
englishToChinese = M.fromList [
    ("hello", "你好")
  , ("bye", "再见")
  , ("how are you", "你好吗")
  , ("pretty good", "很好")
  ]

chineseToEnglish :: M.Map Chinese English
chineseToEnglish = M.foldWithKey (flip M.insert) M.empty englishToChinese

engToCh :: English -> Maybe Chinese
engToCh e = M.lookup e englishToChinese

chToEng :: Chinese -> Maybe English
chToEng c = M.lookup c chineseToEnglish
