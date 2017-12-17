module Bills.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Bill)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


view : WebData (List Bill) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


maybeList : WebData (List Bill) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success bills ->
            list bills

        RemoteData.Failure error ->
            text (toString error)


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Bills" ] ]


list : List Bill -> Html Msg
list bills =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Category" ]
                    , th [] [ text "Company" ]
                    , th [] [ text "Amount" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map billRow bills)
            ]
        ]


billRow : Bill -> Html Msg
billRow bill =
    tr []
        [ td [] [ text bill.category ]
        , td [] [ text bill.company ]
        , td [] [ text (toString bill.amount) ]
        , td []
            []
        ]
