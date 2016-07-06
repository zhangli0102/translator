module Translator
    ( Chinese
    , English
    , German
    , englishToChinese
    , chineseToEnglish
    , germanToChinese
    , chineseToGerman
    , englishToGerman
    , germanToEnglish
    , engToCh
    , chToEng
    , gerToCh
    , chToGer
    , engToGer
    , gerToEng
    ) where

import qualified Data.Map as M

type Chinese = String
type English = String
type German = String

englishToChinese :: (M.Map English Chinese)
englishToChinese = M.fromList [
    ("hello", "你好")
  , ("bye", "再见")
  , ("How are you", "你好吗")
  , ("Pretty good", "很好")
  , ("Li Zhang", "张立")
  , ("What a day", "今天真烦")
  , ("delicious", "好吃")
  , ("Functional Programming", "函数式编程")
  ]

germanToChinese :: (M.Map German Chinese)
germanToChinese = M.fromList [
    ("Guten Tag", "你好")
  , ("Guten Morgen", "早上好")
  , ("Auf Wiedersehen", "再见")
  , ("Kartofel", "土豆")
  , ("Apfel", "苹果")
  , ("Danke", "谢谢")
  , ("Deutschland", "德国")
  , ("Trost", "安慰")
  ]

englishToGerman :: (M.Map English German)
englishToGerman = M.fromList [
    ("Good morning", "Guten Morgen")
  , ("See you", "Auf wiedersehen")
  , ("Germany", "Deutschland")
  , ("star", "Stern")
  , ("time", "Zeit")
  , ("champion", "Meister")
  , ("comfort", "Trost")
  , ("potato", "Kartofel")
  , ("apple", "Apfel")
  ]

chineseToEnglish :: M.Map Chinese English
chineseToEnglish = M.foldWithKey (flip M.insert) M.empty englishToChinese

chineseToGerman :: M.Map Chinese German
chineseToGerman = M.foldWithKey (flip M.insert) M.empty germanToChinese

germanToEnglish :: M.Map German English
germanToEnglish = M.foldWithKey (flip M.insert) M.empty englishToGerman

engToCh :: English -> Maybe Chinese
engToCh e = M.lookup e englishToChinese

chToEng :: Chinese -> Maybe English
chToEng c = M.lookup c chineseToEnglish


gerToCh :: German -> Maybe Chinese
gerToCh g = M.lookup g germanToChinese

chToGer :: Chinese -> Maybe German
chToGer c = M.lookup c chineseToGerman

engToGer :: English -> Maybe German
engToGer e = M.lookup e englishToGerman

gerToEng :: German -> Maybe English
gerToEng g = M.lookup g germanToEnglish
