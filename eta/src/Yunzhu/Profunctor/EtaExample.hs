{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}

module Yunzhu.Profunctor.EtaExample where

import Java
import Java.StringUtils as S
import Yunzhu.Profunctor.Android
import Yunzhu.Profunctor.Graphics

data {-# CLASS "yunzhu.profunctor.textdemo.ActivityImpl" #-}
  ActivityImpl = ActivityImpl (Object# ActivityImpl)

foreign export java "@static startActivity"
  startActivity :: Activity -> Java ActivityImpl ()

startActivity :: Activity -> Java a ()
startActivity activity = do
  view <- newGraphSurfaceView activity
  -- view <- newTextView activity
  -- view <.> setText (foldr S.concat "Hello, World!" (replicate 10 "Eta "))
  activity <.> setContentView view

