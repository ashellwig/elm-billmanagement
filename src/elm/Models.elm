module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { bills : WebData (List Bill)
    , route : Route
    }


initalModel : Route -> Model
initalModel route =
    { bills = RemoteData.Loading
    , route = route
    }


type alias BillCategory =
    String


type alias Bill =
    { category : BillCategory
    , company : String
    , amount : Int
    }


type Route
    = BillsRoute
    | BillRoute BillCategory
    | NotFoundRoute
