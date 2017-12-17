module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { bills : WebData (List Bill)
    }


initalModel : Model
initalModel =
    { bills = RemoteData.Loading
    }


type alias BillCategory =
    String


type alias Bill =
    { category : BillCategory
    , company : String
    , amount : Int
    }
