module Msgs exposing (..)

import Models exposing (Bill)
import RemoteData exposing (WebData)


type Msg
    = OnFetchBills (WebData (List Bill))
