module View exposing (..)

import Bills.Edit
import Bills.List
import Html exposing (Html, div, text)
import Models exposing (BillCategory, Model)
import Msgs exposing (Msg)
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.BillsRoute ->
            Bills.List.view model.bills

        Models.BillRoute category ->
            billEditPage model category

        Models.NotFoundRoute ->
            notFoundView


billEditPage : Model -> BillCategory -> Html Msg
billEditPage model billCategory =
    case model.bills of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success bills ->
            let
                maybeBill =
                    bills
                        |> List.filter (\bill -> bill.category == billCategory)
                        |> List.head
            in
            case maybeBill of
                Just bill ->
                    Bills.Edit.view bill

                Nothing ->
                    notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
