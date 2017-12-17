module Msgs exposing (..)

import Http
import Models exposing (Bill)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchBills (WebData (List Bill))
    | OnLocationChange Location
    | ChangeAmount Bill Int
    | OnBillSave (Result Http.Error Bill)
