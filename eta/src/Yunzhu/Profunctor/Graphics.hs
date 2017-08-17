{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}

module Yunzhu.Profunctor.Graphics where

import Java
import Yunzhu.Profunctor.Android

import Data.Bits

data {-# CLASS "yunzhu.profunctor.graphics.GraphSurfaceView extends android.view.View" #-}
  GraphSurfaceView = GraphSurfaceView (Object# GraphSurfaceView)
  deriving Class

type instance Inherits GraphSurfaceView = '[View]

foreign import java unsafe "@new"
  newGraphSurfaceView :: (c <: Context) => c -> Java a GraphSurfaceView

data {-# CLASS "android.graphics.Canvas" #-}
  Canvas = Canvas (Object# Canvas)
  deriving Class

foreign import java unsafe "drawRect"
  drawRect :: Float -> Float -> Float -> Float -> Paint -> Java Canvas ()

foreign import java unsafe "drawCircle"
  drawCircle :: Float -> Float -> Float -> Paint -> Java Canvas ()

data {-# CLASS "android.graphics.Paint" #-}
  Paint = Paint (Object# Paint)
  deriving Class

foreign import java unsafe "@new"
  newPaint :: Int -> Java a Paint

foreign import java unsafe "setColor"
  setColor :: Int -> Java Paint ()

foreign export java "onDraw"
  onDraw :: Canvas -> Java GraphSurfaceView ()

color :: Int -> Int -> Int -> Int -> Int
color a r g b = a `shiftL` 24 .|. r `shiftL` 16 .|. g `shiftL` 8 .|. b

onDraw canvas = do -- return ()
  paint <- newPaint 1
  paint <.> setColor (color 234 34 203 89)
  canvas <.> drawCircle 200 200 100 paint
  paint <.> setColor (color 255 234 84 234)
  canvas <.> drawCircle 600 200 100 paint
  paint <.> setColor (color 234 203 203 89)
  canvas <.> drawRect 200 500 600 700 paint
  return ()
