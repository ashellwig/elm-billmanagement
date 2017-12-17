module Bills.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, value)
import Html.Events exposing (onClick)
import Models exposing (Bill)
import Msgs exposing (Msg)
import Routing exposing (billsPath)


view : Bill -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Bill -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Bill -> Html Msg
form bill =
    div [ class "m3" ]
        [ h1 [] [ text bill.company ]
        , formAmount bill
        ]


formAmount : Bill -> Html Msg
formAmount bill =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Amount" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString bill.amount) ]
            , btnAmountDecrease bill
            , btnAmountIncrease bill
            ]
        ]


btnAmountDecrease : Bill -> Html Msg
btnAmountDecrease bill =
    let
        message =
            Msgs.ChangeAmount bill -1
    in
    a [ class "btn ml1 h1", onClick message ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnAmountIncrease : Bill -> Html Msg
btnAmountIncrease bill =
    let
        message =
            Msgs.ChangeAmount bill 1
    in
    a [ class "btn ml1 h1", onClick message ]
        [ i [ class "fa fa-plus-circle" ] [] ]


listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href billsPath
        ]
        [ i [ class "fa-chevron-left mr1" ] [], text "List" ]
