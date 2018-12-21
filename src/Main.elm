module Main exposing (init, main, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (Error(..))
import Json.Decode as D
import Types exposing (..)
import WebsiteHelper as WH



-- ---------------------------
-- MODEL
-- ---------------------------


initGfycatUrls =
    -- source: reddit.com/r/gifs
    [ "https://gfycat.com/babyishbackfishingcat"
    , "https://gfycat.com/LimpingFlamboyantHorsechestnutleafminer"
    , "https://gfycat.com/ShinyChillyGrasshopper"
    , "https://gfycat.com/ColdFlickeringAmphibian"
    ]


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( Model initGfycatUrls (WH.filterByMatch initGfycatUrls), Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


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
    div
        []
        (List.map (\( url, wh ) -> WH.render wh url) model.matches)



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
