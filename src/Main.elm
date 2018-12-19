module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (Error(..))
import Json.Decode as Decode



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Flags =
    ()


type alias Model =
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( (), Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


type Msg
    = Void


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Void ->
            ( model, Cmd.none )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Html Msg
view model =
    div [] [ text "Hello World!" ]



-- ---------------------------
-- MAIN
-- ---------------------------


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "Relmdditallery"
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
