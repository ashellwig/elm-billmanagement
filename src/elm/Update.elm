module Update exposing (..)

import Commands exposing (saveBillCmd)
import Models exposing (Bill, Model)
import Msgs exposing (Msg)
import RemoteData
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchBills response ->
            ( { model | bills = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }, Cmd.none )

        Msgs.ChangeAmount bill howMuch ->
            let
                updatedBill =
                    { bill | amount = bill.amount + howMuch }
            in
            ( model, saveBillCmd updatedBill )

        Msgs.OnBillSave (Ok bill) ->
            ( updateBill model bill, Cmd.none )

        Msgs.OnBillSave (Err error) ->
            ( model, Cmd.none )


updateBill : Model -> Bill -> Model
updateBill model updateBill =
    let
        pick currentBill =
            if updateBill.category == currentBill.category then
                updateBill
            else
                currentBill

        updateBillList bills =
            List.map pick bills

        updatedBills =
            RemoteData.map updateBillList model.bills
    in
    { model | bills = updatedBills }
