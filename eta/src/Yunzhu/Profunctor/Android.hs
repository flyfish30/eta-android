{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
module Yunzhu.Profunctor.Android where

import Java
import Java.StringUtils as S

data {-# CLASS "android.content.Context" #-}
  Context = Context (Object# Context)
  deriving Class

data {-# CLASS "android.app.Activity" #-}
  Activity = Activity (Object# Activity)
  deriving Class

type instance Inherits Activity = '[Context]

data {-# CLASS "android.view.View" #-}
  View = View (Object# View)
  deriving Class

data {-# CLASS "android.widget.TextView" #-}
  TextView = TextView (Object# TextView)
  deriving Class

type instance Inherits TextView = '[View]

foreign import java unsafe "@new"
  newTextView :: (c <: Context) => c -> Java a TextView

foreign import java unsafe "setContentView"
  setContentView :: (v <: View) => v -> Java Activity ()

foreign import java unsafe "setText"
  setText :: (c <: CharSequence) => c -> Java TextView ()

data {-# CLASS "Yunzhu.profunctor.android.ActivityImpl" #-}
  ActivityImpl = ActivityImpl (Object# ActivityImpl)

foreign export java "@static startActivity"
  startActivity :: Activity -> Java ActivityImpl ()

startActivity :: Activity -> Java a ()
startActivity activity = do
  textView <- newTextView activity
  textView <.> setText (foldr S.concat "World!" (replicate 10 "Eta "))
  activity <.> setContentView textView

