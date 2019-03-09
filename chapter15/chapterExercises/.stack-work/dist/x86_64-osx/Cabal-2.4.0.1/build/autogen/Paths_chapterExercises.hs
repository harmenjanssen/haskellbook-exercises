{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_chapterExercises (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/harmen/Code/haskell/haskellbook-exercises/chapter15/chapterExercises/.stack-work/install/x86_64-osx/lts-13.3/8.6.3/bin"
libdir     = "/Users/harmen/Code/haskell/haskellbook-exercises/chapter15/chapterExercises/.stack-work/install/x86_64-osx/lts-13.3/8.6.3/lib/x86_64-osx-ghc-8.6.3/chapterExercises-0.1.0.0-1JLD8mSLlxaJUXcaZhvZXS"
dynlibdir  = "/Users/harmen/Code/haskell/haskellbook-exercises/chapter15/chapterExercises/.stack-work/install/x86_64-osx/lts-13.3/8.6.3/lib/x86_64-osx-ghc-8.6.3"
datadir    = "/Users/harmen/Code/haskell/haskellbook-exercises/chapter15/chapterExercises/.stack-work/install/x86_64-osx/lts-13.3/8.6.3/share/x86_64-osx-ghc-8.6.3/chapterExercises-0.1.0.0"
libexecdir = "/Users/harmen/Code/haskell/haskellbook-exercises/chapter15/chapterExercises/.stack-work/install/x86_64-osx/lts-13.3/8.6.3/libexec/x86_64-osx-ghc-8.6.3/chapterExercises-0.1.0.0"
sysconfdir = "/Users/harmen/Code/haskell/haskellbook-exercises/chapter15/chapterExercises/.stack-work/install/x86_64-osx/lts-13.3/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "chapterExercises_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "chapterExercises_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "chapterExercises_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "chapterExercises_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "chapterExercises_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "chapterExercises_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
