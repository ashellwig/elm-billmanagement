module Routing exposing (..)

import Models exposing (BillCategory, Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


-- Matcher


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map BillsRoute top
        , map BillRoute (s "bills" </> string)
        , map BillsRoute (s "bills")
        ]



-- Parse (Location)


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


billsPath : String
billsPath =
    "#bills"


billPath : BillCategory -> String
billPath category =
    "#bills/" ++ category
