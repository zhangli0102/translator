module Main where

import Control.Monad (forever, when)
import Translator (chToEng, engToCh, chToGer, gerToCh)
import System.Environment (getArgs)
import System.Exit (exitFailure, exitSuccess)
import System.IO (hGetLine, hIsEOF, stdin)

chineseToEnglish :: IO()
chineseToEnglish = forever $ do
  weAreDone <- hIsEOF stdin
  when weAreDone exitSuccess

  line <- hGetLine stdin
  convertLine line

  where
    convertLine line = do
      let english = chToEng line
      case english of
        (Just str)
          -> putStrLn str
        Nothing
          -> do
            putStrLn $ "Error: " ++ line
            exitFailure

englishToChinese :: IO()
englishToChinese = forever $ do
  weAreDone <- hIsEOF stdin
  when weAreDone exitSuccess

  line <- hGetLine stdin
  convertLine line

  where
    convertLine line = do
      let chinese = engToCh line
      case chinese of
        (Just str)
          -> putStrLn str
        Nothing
          -> do
            putStrLn $ "Error: " ++ line
            exitFailure

chineseToGerman :: IO()
chineseToGerman = forever $ do
  weAreDone <- hIsEOF stdin
  when weAreDone exitSuccess

  line <- hGetLine stdin
  convertLine line

  where
    convertLine line = do
      let german = chToGer line
      case german of
        (Just str)
          -> putStrLn str 
        Nothing
          -> do
            putStrLn $ "Error: " ++ line
            exitFailure

germanToChinese :: IO()
germanToChinese = forever $ do
  weAreDone <- hIsEOF stdin
  when weAreDone exitSuccess

  line <- hGetLine stdin
  convertLine line

  where
    convertLine line = do
      let chinese = gerToCh line
      case chinese of
        (Just str)
          -> putStrLn str 
        Nothing
          -> do
            putStrLn $ "Error: " ++ line
            exitFailure


main :: IO()
main = do
  mode <- getArgs
  case mode of 
    [arg] ->
      case arg of
        "engch" -> englishToChinese
        "cheng" -> chineseToEnglish
        "gerch" -> germanToChinese
        "chger" -> chineseToGerman
        _       -> argError
    _ -> argError

    where argError = do
            putStrLn "Please specify the first argument as being 'engch' or 'cheng'"
            exitFailure
















