port module Main exposing (init, load, main, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (Error(..))
import Json.Decode as D
import Json.Encode as E
import Types exposing (..)
import WebsiteHelper as WH



-- ---------------------------
-- PORTS
-- ---------------------------


port load : String -> Cmd msg



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
    ( { reddit = "/r/gifs"
      , urls = initGfycatUrls
      , matches = WH.filterByMatch initGfycatUrls
      , nextId = 0
      }
    , Cmd.none
    )



-- ---------------------------
-- UPDATE
-- ---------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Next ->
            let
                newMatches =
                    case model.matches of
                        [] ->
                            []

                        x :: xs ->
                            xs ++ [ x ]
            in
            ( { model | matches = newMatches }
            , load ""
            )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Html Msg
view model =
    div
        []
        [ List.head model.matches
            |> Maybe.map (\( url, wh ) -> WH.render wh url)
            |> Maybe.withDefault (text "")
        ]



--(List.map (\( url, wh ) -> WH.render wh url) model.matches)
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
