module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
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
