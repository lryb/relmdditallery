module WebsiteHelper exposing (filterByMatch, render)

import Html as H exposing (Html)
import Html.Attributes as HA
import Html.Events as HE
import Json.Decode as D
import Types exposing (..)


activeHelpers : List WebsiteHelper
activeHelpers =
    [ Gfycat ]


toProps : WebsiteHelper -> WebsiteHelperProps
toProps wh =
    case wh of
        Gfycat ->
            WebsiteHelperProps [ \s -> String.contains "gfycat.com" s && String.any Char.isUpper s ] renderGfycat


filterByMatch : List String -> List ( String, WebsiteHelper )
filterByMatch urls =
    urls
        |> List.concatMap (\url -> hasMatch url |> Maybe.map (\wh -> [ ( url, wh ) ]) |> Maybe.withDefault [])


hasMatch : String -> Maybe WebsiteHelper
hasMatch url =
    List.filter (\wh -> matches wh url) activeHelpers |> List.head


matches : WebsiteHelper -> String -> Bool
matches wh url =
    wh |> toProps |> .matchers |> List.any (\matcher -> matcher url)



-- ------
-- RENDER
-- ------


render : WebsiteHelper -> String -> Html Msg
render wh url =
    (wh |> toProps |> .render) url


renderGfycat : String -> Html Msg
renderGfycat url =
    let
        handler =
            HE.on "ended" (D.succeed Next)

        identifier =
            (String.split "/" >> List.reverse >> List.head >> Maybe.withDefault "") url

        source =
            "https://giant.gfycat.com/" ++ identifier ++ ".mp4"
    in
    H.video [ HA.id "gfycat", HA.class "fullscreen-video", HA.autoplay True, HA.preload "auto", handler, HE.onClick Next ] [ H.source [ HA.src source ] [] ]
