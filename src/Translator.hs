module Translator
    ( Chinese
    , English
    , German
    , englishToChinese
    , chineseToEnglish
    , germanToChinese
    , chineseToGerman
    , engToCh
    , chToEng
    , gerToCh
    , chToGer
    ) where

import qualified Data.Map as M

type Chinese = String
type English = String
type German = String

englishToChinese :: (M.Map English Chinese)
englishToChinese = M.fromList [
    ("hello", "你好")
  , ("bye", "再见")
  , ("how are you", "你好吗")
  , ("pretty good", "很好")
  , ("Li Zhang", "张立")
  , ("What the hell", "去他妈的")
  , ("What a day", "今天真烦")
  , ("delicious", "好吃")
  , ("Functional Programming", "函数式编程")
  ]

chineseToEnglish :: M.Map Chinese English
chineseToEnglish = M.foldWithKey (flip M.insert) M.empty englishToChinese

germanToChinese :: (M.Map German Chinese)
germanToChinese = M.fromList [
    ("Guten Tag", "你好")
  , ("Guten Morgen", "早上好")
  , ("Auf Wiedersehen", "再见")
  , ("Kartofel", "土豆")
  , ("Apfel", "苹果")
  , ("Danke", "谢谢")
  , ("Deutschland", "德国")
  ]

chineseToGerman :: M.Map Chinese German
chineseToGerman = M.foldWithKey (flip M.insert) M.empty germanToChinese

engToCh :: English -> Maybe Chinese
engToCh e = M.lookup e englishToChinese

chToEng :: Chinese -> Maybe English
chToEng c = M.lookup c chineseToEnglish


gerToCh :: German -> Maybe Chinese
gerToCh g = M.lookup g germanToChinese

chToGer :: Chinese -> Maybe German
chToGer c = M.lookup c chineseToGerman
