module View exposing (..)

import Bills.List
import Html exposing (Html, div, text)
import Models exposing (Model)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    Bills.List.view model.bills
