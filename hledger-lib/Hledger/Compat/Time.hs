{-# LANGUAGE CPP #-}

module Hledger.Compat.Time
  ( module X
  , parseTime
  ) where

#if MIN_VERSION_time(1,5,0)
import Data.Time.Format as X hiding (parseTime, months)

parseTime :: ParseTime t => TimeLocale -> String -> String -> Maybe t
parseTime = parseTimeM True

#else
import Data.Time.Format
import System.Locale as X (defaultTimeLocale)
#endif
