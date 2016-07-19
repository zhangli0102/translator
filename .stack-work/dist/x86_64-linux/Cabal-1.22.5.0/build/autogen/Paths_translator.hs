module Paths_translator (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vagrant/src/translator/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/bin"
libdir     = "/home/vagrant/src/translator/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/lib/x86_64-linux-ghc-7.10.3/translator-0.1.0.0-7Z1wDWZ3VSoEPaDaYBr3lm"
datadir    = "/home/vagrant/src/translator/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/share/x86_64-linux-ghc-7.10.3/translator-0.1.0.0"
libexecdir = "/home/vagrant/src/translator/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/libexec"
sysconfdir = "/home/vagrant/src/translator/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "translator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "translator_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "translator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "translator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "translator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
