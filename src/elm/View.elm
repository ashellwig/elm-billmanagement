module View exposing (..)

import Bills.List
import Html exposing (Html, div, text)
import Models exposing (Model)
import Msgs exposing (Msg)
import Style
import Style.Color as Color
import Style.Font as Font
import Style.Grid


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    Bills.List.view model.bills



-- Type for Style Identifiers
-- (Like CSS Classes)
type MyStyles
