module Msgs exposing (..)

import Models exposing (Bill)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchBills (WebData (List Bill))
    | OnLocationChange Location
