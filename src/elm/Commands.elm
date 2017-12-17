module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import Models exposing (Bill, BillCategory)
import Msgs exposing (Msg)
import RemoteData


fetchBills : Cmd Msg
fetchBills =
    Http.get fetchBillsUrl billsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchBills


fetchBillsUrl : String
fetchBillsUrl =
    "http://localhost:4000/bills"


billsDecoder : Decode.Decoder (List Bill)
billsDecoder =
    Decode.list billDecoder


billDecoder : Decode.Decoder Bill
billDecoder =
    decode Bill
        |> required "category" Decode.string
        |> required "company" Decode.string
        |> required "amount" Decode.int


saveBillUrl : BillCategory -> String
saveBillUrl billCategory =
    "http://localhost.com:4000/bills/" ++ billCategory


saveBillRequest : Bill -> Http.Request Bill
saveBillRequest bill =
    Http.request
        { body = billEncoder bill |> Http.jsonBody
        , expect = Http.expectJson billDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveBillUrl bill.category
        , withCredentials = False
        }


saveBillCmd : Bill -> Cmd Msg
saveBillCmd bill =
    saveBillRequest bill
        |> Http.send Msgs.OnBillSave


billEncoder : Bill -> Encode.Value
billEncoder bill =
    let
        attributes =
            [ ( "category", Encode.string bill.category )
            , ( "company", Encode.string bill.company )
            , ( "amount", Encode.int bill.amount )
            ]
    in
    Encode.object attributes
